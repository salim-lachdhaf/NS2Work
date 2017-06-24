/***************************************************************************
 *   Copyright (C) 2005 by Francisco J. Ros                                *
 *   fjrm@dif.um.es                                                        *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/

#include "dymo_um.h"

#include <assert.h>
#include <string.h>

static void
dymoum_mac_failed_callback(Packet *p, void *arg) {
	((DYMOUM *) arg)->mac_failed(p);
}

int hdr_dymoum::offset_;
static class DYMOUMHeaderClass : public PacketHeaderClass {
public:
	DYMOUMHeaderClass() : PacketHeaderClass("PacketHeader/DYMOUM",
						DYMO_MSG_MAX_SIZE) {
		bind_offset(&hdr_dymoum::offset_);
	}
} class_rtProtoDYMOUM_hdr;


static class DYMOUMClass : public TclClass {
public:
	DYMOUMClass() : TclClass("Agent/DYMOUM") { }
	TclObject *create(int argc, const char*const* argv) {
		assert(argc == 5);
		return new DYMOUM(
			(nsaddr_t) Address::instance().str2addr(argv[4])
		);
	}
} class_rtProtoDYMOUM;


void
DYMOUM_QueueTimer::expire(Event *e) {
	struct timeval *timeout;
	
	timeout = agent_->timer_age_queue();
	
	if (timeout)
		resched((double) timeout->tv_sec +
			((double) timeout->tv_usec / 1000000.0));
}

NS_CLASS DYMOUM(nsaddr_t id) : Agent(PT_DYMOUM), qtimer_(this),
				initialized_(0), pq_len(0)
{
	/*
	 Enable usage of some of the configuration variables from Tcl.
	
	 Note: Do NOT change the values of these variables in the constructor
	 after binding them! The desired default values should be set in
	 ~ns/tcl/lib/ns-default.tcl instead.
	*/
	bind_bool("no_path_acc_", &no_path_acc);
	bind_bool("reissue_rreq_", &reissue_rreq);
	bind_bool("s_bit_", &s_bit);
	bind("hello_ival_", &hello_ival);
	
	// Set general parameters
	progname = strdup("DYMOUM");
	
	memset(&this_host, 0, sizeof(struct host_info));
	memset(dev_indices, 0, sizeof(unsigned int) * DYMO_MAX_NR_INTERFACES);
	this_host.seqnum	= 1;
	this_host.nif		= 1;
	this_host.prefix	= 0;
	this_host.is_gw		= 0;
	this_host.BLACKHOLE		= false; /*initialisation de BLACKHole to false */
	this_host.NbRREP		= 0; /* ini RREP compting */
	this_host.MaxSeq              = 0;  /* ini Max Sq nb received */
    this_host.MinSeq              = 65535;  /* ini Min Sq Nb Received */
	
	const char faked_ifname[]	= "nsif";
	dev_indices[NS_DEV_NR]		= NS_IFINDEX;
	
	strncpy(DEV_NR(NS_DEV_NR).ifname, faked_ifname, IFNAMSIZ - 1);
	DEV_NR(NS_DEV_NR).ifname[IFNAMSIZ - 1]	= '\0';
	DEV_NR(NS_DEV_NR).ipaddr.s_addr		= id;
	DEV_NR(NS_DEV_NR).bcast.s_addr		= DYMO_BROADCAST;
	DEV_NR(NS_DEV_NR).enabled		= 1;
	DEV_NR(NS_DEV_NR).sock			= -1;
	DEV_NR(NS_DEV_NR).ifindex		= NS_IFINDEX;
	
	INIT_DLIST_HEAD(&TQ);
	INIT_DLIST_HEAD(&PENDING_RREQ);
	INIT_DLIST_HEAD(&BLACKLIST);
	INIT_DLIST_HEAD(&NBLIST);
	
	// Set agent parameters
	ra_addr_	= id;
	addr()		= id;
	port()		= RT_PORT;
	dport()		= RT_PORT;
	
	// Initialize data structures and services
	dymo_socket_init();
	icmp_socket_init();
	packet_queue_init();
	rtable_init();

}


NS_CLASS ~DYMOUM() {
	rtable_destroy();
	packet_queue_fini();
	icmp_socket_fini();
	dymo_socket_fini();
	hello_fini();
}

int NS_CLASS command(int argc, const char*const* argv) {
	if (argc == 2) {
		if (strcasecmp(argv[1], "start") == 0) {
			return start();
		}


/////////////////////////////////// Black hole definition : ce noeud est un black hole /////////////////
		 if(strncasecmp(argv[1], "blackhole", 9) == 0) {
		   this_host.BLACKHOLE=true;
		   return TCL_OK;
		}
///////////////////////////////////////////////////////////////////////////////////////////////////////
	}
	else if (argc == 3) {
		// Get corresponding port classifier, although it is never used
		if (strcmp(argv[1], "port-dmux") == 0) {
			if (TclObject::lookup(argv[2]) == 0) {
				fprintf(stderr, "%s: %s lookup of %s failed\n",
					__FILE__,
					argv[1],
					argv[2]);
				return TCL_ERROR;
			}
			return TCL_OK;
		}
		// Get corresponding tracer
		else if (strcmp(argv[1], "log-target") == 0 ||
			strcmp(argv[1], "tracetarget") == 0) {
			logtarget_ = (Trace*) TclObject::lookup(argv[2]);
			if (logtarget_ == 0)
				return TCL_ERROR;
			return TCL_OK;
		}
		// Enable promiscuous mode
		else if (strcmp(argv[1], "install-tap") == 0) {
			mac_ = (Mac *) TclObject::lookup(argv[2]);
			if (mac_ == 0)
				return TCL_ERROR;
			mac_->installTap(this);
			return TCL_OK;
		}
	}
	// Pass the command to the base class
	return Agent::command(argc, argv);
}

int NS_CLASS start() {
	if (initialized_ == 0) {
		debug("DYMOUM agent started in node %d\n", ra_addr_);
		debug("\tno_path_acc=%d\n", no_path_acc);
		debug("\treissue_rreq=%d\n", reissue_rreq);
		debug("\ts_bit=%d\n", s_bit);
		debug("\thello_ival=%d\n\n", hello_ival);
		
		initialized_ = 1;
		hello_init();
		schedule_next_event();
		
		return TCL_OK;
	}
	return TCL_ERROR;
}

void NS_CLASS schedule_next_event() {
	struct timeval *timeout;
	
	timeout = timer_age_queue();
	
	if (timeout)
		qtimer_.resched((double) timeout->tv_sec +
				(double) timeout->tv_usec / (double) 1000000);
}

void NS_CLASS recv(Packet *p, Handler *h) {
	struct hdr_cmn *ch	= HDR_CMN(p);
	struct hdr_ip *ih	= HDR_IP(p);
	
	assert(initialized_);

/////////////////////////////////Intercepter les packet data <BlackHole>//////////////////////////////////////
	if(this_host.BLACKHOLE && ch->ptype() != PT_DYMOUM && ch->num_forwards() == 0){//n'est pas un paquet de rrep, rreq
		//printf("To %u passes from black hole\n",ih->saddr() );
		drop(p, DROP_RTR_ROUTE_LOOP);
		schedule_next_event();
		return;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	if (ih->saddr() == ra_addr_) {
		// If there exists a loop, must drop the packet
		if (ch->num_forwards() > 0) {
			drop(p, DROP_RTR_ROUTE_LOOP);
			schedule_next_event();
			return;
		}
		// else if this is a packet I am originating, must add IP header
		else if (ch->num_forwards() == 0)
			ch->size() += IP_HDR_LEN;
	}
	
	// If it is a DYMOUM packet, must process it
	if (ch->ptype() == PT_DYMOUM)
		recv_dymoum_pkt(p);
	// Otherwise, must forward the packet (unless TTL has reached zero)
	else {
		ih->ttl_--;
		if (ih->ttl_ == 0) {
			drop(p, DROP_RTR_TTL);
			schedule_next_event();
			return;
		}
		process_data(p);
	}
	
	schedule_next_event();
}
void NS_CLASS process_data(Packet *p) {
	struct hdr_cmn* ch	= HDR_CMN(p);
	struct hdr_ip* ih	= HDR_IP(p);
	
	ch->direction() = hdr_cmn::DOWN;
	ch->addr_type() = NS_AF_INET;
	
	if ((u_int32_t) ih->daddr() == IP_BROADCAST)
		ch->next_hop_ = IP_BROADCAST;
	else {
		struct in_addr dest_addr;
		
		dest_addr.s_addr	= ih->daddr();
		rtable_entry_t *entry	= rtable_find(dest_addr);//check the adress from table
		if (!entry || entry->rt_state == RT_INVALID) {
			// If I am the originating node, then a route discovery
			// must be performed
			if (ih->saddr() == ra_addr_) {
				packet_queue_add(p, dest_addr);
				route_discovery(dest_addr);
			}
			// Else we must send a RERR message to the source if
			// the route has been previously used
			else {
				if (entry->rt_is_used)
					rerr_send(dest_addr, NET_DIAMETER, entry);
				drop(p, DROP_RTR_NO_ROUTE);
			}
			schedule_next_event();
			return;
		}
		else
		{
			ch->prev_hop_ = ra_addr_;
			ch->next_hop_ =
				(nsaddr_t) entry->rt_nxthop_addr.s_addr;
			
			// Use link layer feedback if HELLO messages are disabled
			if (hello_ival <= 0)
			{
				ch->xmit_failure_	= dymoum_mac_failed_callback;
				ch->xmit_failure_data_	= (void *) this;
			}
			
			// Update route to dst
			rtable_update_timeout(entry);
			dlog(LOG_DEBUG, 0, __FUNCTION__,
				"route to dst %s updated",
				ip2str(ih->daddr()));
		}
	}
	
	Scheduler::instance().schedule(target_, p, 0.0);
	schedule_next_event();
}

int NS_CLASS gettimeofday(struct timeval *tv, struct timezone *tz) {
	double current_time, tmp;
	
	if (!tv)
		return -1;
	
	current_time = Scheduler::instance().clock();
	
	tv->tv_sec	= (long) current_time;
	tmp		= (current_time - tv->tv_sec) * 1000000;
	tv->tv_usec	= (long) tmp;
	
	return 0;
}

void NS_CLASS tap(const Packet *p) {
	rtable_entry_t *entry;
	struct in_addr addr;
	struct hdr_cmn *ch	= HDR_CMN(p);
	struct hdr_ip *ih	= HDR_IP(p);
	
	// We aren't interested in non-data packets
	if (!DATA_PACKET(ch->ptype())) {
		schedule_next_event();
		return;
	}
	
	// If this is a packet I'm receiving, update route to src
	if (ch->next_hop_ == ra_addr_)
	{
		addr.s_addr = ih->saddr();
		entry = rtable_find(addr);
		if (entry)
		{
			rtable_update_timeout(entry);
			dlog(LOG_DEBUG, 0, __FUNCTION__,
				"route to src %s updated",
				ip2str(ih->saddr()));
		}
		else
			dlog(LOG_DEBUG, 0, __FUNCTION__,
				"could not update route to src %s "
				"because there was no such route",
				ip2str(ih->saddr()));
	}
	
	schedule_next_event();
}

void NS_CLASS mac_failed(Packet *p) {
	struct hdr_cmn *ch	= HDR_CMN(p);
	struct hdr_ip *ih	= HDR_IP(p);
	
	if (DATA_PACKET(ch->ptype()) &&
		(u_int32_t) ih->daddr() != IP_BROADCAST)
	{
		struct in_addr addr;
		
		addr.s_addr = ch->next_hop();
		rtable_expire_timeout_all(addr, NS_IFINDEX);
	}
	
	drop(p, DROP_RTR_MAC_CALLBACK);
	schedule_next_event();
}
