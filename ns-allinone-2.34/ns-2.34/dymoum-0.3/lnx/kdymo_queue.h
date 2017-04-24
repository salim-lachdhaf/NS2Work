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

#ifndef __KDYMO_QUEUE_H__
#define __KDYMO_QUEUE_H__

#ifdef __KERNEL__

#include <linux/types.h>
#include <linux/skbuff.h>

/* Queue of packets which are waiting for the completion of a route
   discovery */

#define KDYMO_QUEUE_DROP	1
#define KDYMO_QUEUE_SEND	2

/* Initialize the queue */
int kdymo_queue_init(void);

/* Destroy the queue */
void kdymo_queue_fini(void);

/* Remove all elements from the queue */
void kdymo_queue_flush(void);

/* Check whether there is a packet with the given destination address */
int kdymo_queue_find(u32 daddr);

/* Enqueue a packet contained in the given socket buffer */
int kdymo_queue_enqueue(struct sk_buff *skb, int (*okfn)(struct sk_buff *));

/* Set the verdict for the given destination address. Packets destined to that
   address are sent or dropped depending on the verdict */
int kdymo_queue_set_verdict(int verdict, u32 daddr);

#endif	/* __KERNEL__ */

#endif	/* __KDYMO_QUEUE_H__ */
