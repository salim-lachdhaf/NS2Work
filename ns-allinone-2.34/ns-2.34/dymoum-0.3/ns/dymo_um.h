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

#ifndef __DYMO_UM_H__
#define __DYMO_UM_H__

#ifndef NS_PORT
#error "You must define NS_PORT in order to compile NS version of DYMOUM"
#endif	/* NS_PORT */

#include <mac.h>
#include <agent.h>
#include <address.h>
#include <packet.h>
#include <trace.h>
#include <random.h>
#include <cmu-trace.h>
#include <timer-handler.h>

/* Forward declaration of DYMO routing agent class */
class DYMOUM;

/* Global definitions */
#undef	NS_NO_GLOBALS
#define	NS_NO_DECLARATIONS

#include "../defs.h"
#include "../debug.h"
#include "../dlist.h"
#include "../dymo_generic.h"
#include "../dymo_re.h"
#include "../dymo_uerr.h"
#include "../dymo_rerr.h"
#include "../dymo_socket.h"
#include "../dymo_timeout.h"
#include "../rtable.h"
#include "../pending_rreq.h"
#include "../timer_queue.h"
#include "../blacklist.h"
#include "../icmp_socket.h"
#include "../dymo_hello.h"
#include "../dymo_nb.h"
#include "packet_queue.h"

#undef	NS_NO_DECLARATIONS

/* In ns2 we don't care about byte order */
#define ntohl(x) x
#define htonl(x) x
#define htons(x) x
#define ntohs(x) x

#define CURRENT_TIME Scheduler::instance().clock()

/* Timer for managing the DYMO queue of timers */
class DYMOUM_QueueTimer : public TimerHandler {
public:
	DYMOUM_QueueTimer(DYMOUM *agent) : TimerHandler() {
		agent_ = agent;
	}

protected:
	DYMOUM *agent_;
	virtual void expire(Event *e);
};

/* DYMO routing agent */
class DYMOUM : public Agent, public Tap {
	// Make friends
	friend class DYMOUM_QueueTimer;
	friend class CMUTrace; // to call re_numblocks() which is protected
	
protected:
	Mac			*mac_;
	Trace			*logtarget_;
	DYMOUM_QueueTimer	qtimer_;
	nsaddr_t		ra_addr_;
	int			initialized_;

	// Variables from main.c
	char	*progname;
	int	no_path_acc;
	int	reissue_rreq;
	int	s_bit;
	int	hello_ival;
	
	// Variables from pending_rreq.c
	dlist_head_t	PENDING_RREQ;
	
	// Variables from timer_queue.c
	dlist_head_t	TQ;
	
	// Variables from blacklist.c
	dlist_head_t	BLACKLIST;
	
	////////////////////////////////:/ Variables from blacklist.c FOR BLACKLIST/////////////////////////////////
	dlist_head_t	HOLEBLACKLIST;

	// Variables from dymo_socket.c
	char	recv_buf[RECV_BUF_SIZE];
	char	send_buf[SEND_BUF_SIZE];
	
	// Variables from icmp_socket.c
	char icmp_send_buf[ICMP_SEND_BUF_SIZE];
	char icmp_recv_buf[ICMP_RECV_BUF_SIZE];
	
	// Variables from dymo_hello.c
	struct timer hello_timer;
	
	// Variables from dymo_nb.c
	dlist_head_t NBLIST;
	
	
	int	gettimeofday(struct timeval *tv, struct timezone *tz);
	int	start();
	void	schedule_next_event();
	void	process_data(Packet *p);
	
#define	NS_NO_GLOBALS
#undef	NS_NO_DECLARATIONS

#undef __DEFS_H__
#include "../defs.h"

#undef __DEBUG_H__
#include "../debug.h"

#undef __DYMO_GENERIC_H__
#include "../dymo_generic.h"

#undef __DYMO_RE_H__
#include "../dymo_re.h"

#undef __DYMO_UERR_H__
#include "../dymo_uerr.h"

#undef __DYMO_RERR_H__
#include "../dymo_rerr.h"

#undef __DYMO_SOCKET_H__
#include "../dymo_socket.h"

#undef __DYMO_TIMEOUT_H__
#include "../dymo_timeout.h"

#undef __RTABLE_H__
#include "../rtable.h"

#undef __PENDING_RREQ_H__
#include "../pending_rreq.h"

#undef __TIMER_QUEUE_H__
#include "../timer_queue.h"

#undef __BLACKLIST_H__
#include "../blacklist.h"

#undef __ICMP_SOCKET_H__
#include "../icmp_socket.h"

#undef __DYMO_HELLO_H__
#include "../dymo_hello.h"

#undef __DYMO_NB_H__
#include "../dymo_nb.h"

#undef __PACKET_QUEUE_H__
#include "packet_queue.h"

#undef NS_NO_GLOBALS

public:
	DYMOUM(nsaddr_t id);
	~DYMOUM();
	int	command(int, const char*const*);
	void	recv(Packet *, Handler *);
	void	mac_failed(Packet *);
	void	tap(const Packet *);
};

#endif	/* __DYMO_UM_H__ */
