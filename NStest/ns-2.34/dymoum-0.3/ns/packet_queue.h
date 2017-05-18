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

#ifndef __PACKET_QUEUE_H__
#define __PACKET_QUEUE_H__

#ifndef NS_NO_GLOBALS

#define MAX_QUEUE_LEN	512

/* Verdicts for queued packets */
enum {
	PQ_DROP = 0,
	PQ_SEND = 1
};

struct packet_queue
{
	dlist_head_t	l;
	Packet		*p;
	struct in_addr	dest_addr;
};
#endif	/* NS_NO_GLOBALS */

#ifndef NS_NO_DECLARATIONS
struct packet_queue PQ;
int pq_len;

/* Initialize the packet queue */
void packet_queue_init();

/* Destroy the packet queue */
void packet_queue_fini();

/* Add a new packet to the queue */
void packet_queue_add(Packet *p, struct in_addr dest_addr);

/* Set a verdict to the packets directed to a given destination: drop them
   or send them. Return the number of packets dropped or sent */
int packet_queue_set_verdict(struct in_addr dest_addr, int verdict);

#endif	/* NS_NO_DECLARATIONS */

#endif	/* __PACKET_QUEUE_H__ */
