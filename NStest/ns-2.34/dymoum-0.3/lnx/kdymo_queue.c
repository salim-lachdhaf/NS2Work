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

/* This code has been taken from AODVUU, which in turn was taken from linux
   kernel implementation. I use it in order to buffer all IP packets which
   a route discovery is being performed for */

#include <linux/module.h>
#include <linux/list.h>
#include <linux/spinlock.h>
#include <linux/ip.h>
#include <linux/netfilter_ipv4.h>
#include <net/icmp.h>

#include "kdymo_queue.h"
#include "kdymo_destl.h"


#define KDYMO_QUEUE_MAX_LEN	1024

struct kdymo_queue_entry
{
	struct list_head	l;
	u32			daddr;
	struct sk_buff		*skb;
	int (*okfn)(struct sk_buff *);
};

typedef int (*kdymo_queue_cmpfn) (struct kdymo_queue_entry *, u32);

static rwlock_t queue_lock = RW_LOCK_UNLOCKED;
unsigned int queue_len;
static LIST_HEAD(queue_head);

static inline int dest_cmp(struct kdymo_queue_entry *e, u32 daddr)
{
	return (daddr == e->daddr);
}

static inline struct kdymo_queue_entry *__kdymo_queue_find(kdymo_queue_cmpfn cmpfn, u32 daddr)
{
	struct list_head *pos;
		
	list_for_each_prev(pos, &queue_head)
	{
		struct kdymo_queue_entry *entry = (struct kdymo_queue_entry *) pos;
		
		if (!cmpfn || cmpfn(entry, daddr))
			return entry;
	}
	
	return NULL;
}

static inline int __kdymo_queue_enqueue(struct kdymo_queue_entry *entry)
{
	if (queue_len >= KDYMO_QUEUE_MAX_LEN)
	{
		if (net_ratelimit())
			printk(KERN_WARNING "kdymo_queue: full at %d entries, "
				"dropping packet(s).\n", queue_len);
		return -ENOSPC;
	}
	
	list_add(&entry->l, &queue_head);
	queue_len++;
	
	return 0;
}

static inline struct kdymo_queue_entry *__kdymo_queue_dequeue(kdymo_queue_cmpfn cmpfn, u32 daddr)
{
	struct kdymo_queue_entry *entry;
	
	if ((entry = __kdymo_queue_find(cmpfn, daddr)) == NULL)
		return NULL;
	
	list_del(&entry->l);
	queue_len--;
	
	return entry;
}

static inline void __kdymo_queue_flush(void)
{
	struct kdymo_queue_entry *entry;
		
	while ((entry = __kdymo_queue_dequeue(NULL, 0)))
	{
		kfree_skb(entry->skb);
		kfree(entry);
	}
}

int kdymo_queue_enqueue(struct sk_buff *skb, int (*okfn)(struct sk_buff *))
{
	int status;
	struct kdymo_queue_entry *entry;
	struct iphdr *iph = skb->nh.iph;
	
	if ((entry = kmalloc(sizeof(struct kdymo_queue_entry), GFP_ATOMIC))
		== NULL)
	{
		printk(KERN_ERR "kdymo_queue: OOM in kdymo_queue_enqueue()\n");
		return -ENOMEM;
	}
	
	entry->daddr	= iph->daddr;
	entry->skb	= skb;
	entry->okfn	= okfn;
	
	write_lock_bh(&queue_lock);
	if ((status = __kdymo_queue_enqueue(entry)) < 0)
		goto unlock;
	write_unlock_bh(&queue_lock);
	
	return status;
	
unlock:
	write_unlock_bh(&queue_lock);
	kfree(entry);
	
	return status;
}

static struct kdymo_queue_entry *kdymo_queue_dequeue(kdymo_queue_cmpfn cmpfn, u32 daddr)
{
	struct kdymo_queue_entry *entry;
	
	write_lock_bh(&queue_lock);
	entry = __kdymo_queue_dequeue(cmpfn, daddr);
	write_unlock_bh(&queue_lock);
	
	return entry;
}

void kdymo_queue_flush(void)
{
	write_lock_bh(&queue_lock);
	__kdymo_queue_flush();
	write_unlock_bh(&queue_lock);
}

int kdymo_queue_find(u32 daddr)
{
	struct kdymo_queue_entry *entry;
	int res = 0;
	
	read_lock_bh(&queue_lock);
	
	if ((entry = __kdymo_queue_find(dest_cmp, daddr)) != NULL)
		res = 1;
	
	read_unlock_bh(&queue_lock);
	
	return res;    
}

int kdymo_queue_set_verdict(int verdict, u32 daddr)
{
	struct kdymo_queue_entry *entry;
	int pkts = 0;
	
	if (verdict == KDYMO_QUEUE_DROP)
	{
		while (1)
		{
			if ((entry = kdymo_queue_dequeue(dest_cmp, daddr))
				== NULL)
				return pkts;
			
			// Send an ICMP message informing the application that
			// the destination was unreachable
			if (pkts == 0)
				icmp_send(entry->skb, ICMP_DEST_UNREACH,
					ICMP_HOST_UNREACH, 0);
			
			kfree_skb(entry->skb);
			kfree(entry);
			pkts++;
		}
	}
	else if (verdict == KDYMO_QUEUE_SEND)
	{
		struct destl_entry e;
		
		while (1)
		{
			if ((entry = kdymo_queue_dequeue(dest_cmp, daddr))
				== NULL)
				return pkts;
			
			if (!kdymo_destl_get(daddr, &e))
				return -1;
			ip_route_me_harder(&entry->skb);
			
			// Reinject packet
			entry->okfn(entry->skb);
			kfree(entry);
			pkts++;
		}
	}
	
	return 0;
}

int kdymo_queue_init(void)
{
	queue_len = 0;
	return 1;
}

void kdymo_queue_fini(void)
{
#ifdef KERNEL26
	synchronize_net();
#endif	/* KERNEL26 */
	kdymo_queue_flush();
}
