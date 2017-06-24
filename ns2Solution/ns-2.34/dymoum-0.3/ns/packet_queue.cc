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

void
NS_CLASS packet_queue_init()
{
	INIT_DLIST_HEAD(&PQ.l);
}

void
NS_CLASS packet_queue_fini()
{
	dlist_head_t *pos, *tmp;
	int count = 0;
	
	dlist_for_each_safe(pos, tmp, &PQ.l)
	{
		struct packet_queue *pq = (struct packet_queue *) pos;
		dlist_del(pos);
		drop(pq->p, DROP_END_OF_SIMULATION);
		free(pq);
		count++;
	}
	pq_len = 0;
	
	dlog(LOG_INFO, 0, __FUNCTION__, "Dropped %d buffered packets", count);
}

void
NS_CLASS packet_queue_add(Packet *p, struct in_addr dest_addr)
{
	struct packet_queue *pq;
	
	if (pq_len >= MAX_QUEUE_LEN)
	{
		dlog(LOG_DEBUG, 0, __FUNCTION__, "Max queue length reached,"
			" removing first packet");
		if (!dlist_empty(&PQ.l))
		{
			pq = (struct packet_queue *) PQ.l.next;
			dlist_del(PQ.l.next);
			drop(pq->p, DROP_RTR_QFULL);
			free(pq);
			pq_len--;
		}
	}
	
	if ((pq = (struct packet_queue *) malloc(sizeof(struct packet_queue)))== NULL)
	{
		dlog(LOG_ERR, errno, __FUNCTION__, "failed malloc()");
		exit(EXIT_FAILURE);
	}
	
	pq->p			= p;
	pq->dest_addr.s_addr	= dest_addr.s_addr;
	dlist_add_tail(&pq->l, &PQ.l);
	
	pq_len++;
}

int
NS_CLASS packet_queue_set_verdict(struct in_addr dest_addr, int verdict)
{
	struct packet_queue *pq;
	dlist_head_t *pos, *tmp;
	int count = 0;
	double delay = 0.0;
	rtable_entry_t *entry = rtable_find(dest_addr);
	
#define ARP_DELAY 0.005
	
	dlist_for_each_safe(pos, tmp, &PQ.l)
	{
		pq = (struct packet_queue *) pos;
		if (pq->dest_addr.s_addr == dest_addr.s_addr)
		{
			struct hdr_cmn *ch;
			
			dlist_del(pos);
			switch (verdict)
			{
				case PQ_SEND:
				
				if (!entry || entry->rt_state == RT_INVALID)
					return -1;
				
				ch = HDR_CMN(pq->p);
				ch->next_hop_ =	(nsaddr_t)entry->rt_nxthop_addr.s_addr;
				
				Scheduler::instance().schedule(target_, pq->p,	delay);
				delay += ARP_DELAY;
				break;
				
				case PQ_DROP:
				
				drop(pq->p, DROP_RTR_NO_ROUTE);
				break;
				
				default:
				
				dlog(LOG_ERR, 0, __FUNCTION__, "unknown verdict %d", verdict);
				exit(EXIT_FAILURE);
			}
			free(pq);
			pq_len--;
			count++;
		}
	}
	
	return count;
}
