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

/* This has been taken from AODVUU implementation (kaodv-expl.c). It maintains
   a list of destination addresses with a valid route. That could be directly
   done just by looking up in the routing table, but I don't know how... */

#include <linux/module.h>
#include <linux/spinlock.h>
#include <linux/netdevice.h>

#include "kdymo_destl.h"


#define DESTL_MAX_LEN	1024

static unsigned int destl_len;
static LIST_HEAD(destl_head);
static rwlock_t destl_lock = RW_LOCK_UNLOCKED;

static inline struct destl_entry *__kdymo_destl_find(u32 daddr)
{
	struct list_head *pos;
	
	list_for_each(pos, &destl_head)
	{
		struct destl_entry *e = (struct destl_entry *) pos;
		
		if (e->daddr == daddr)
			return e;
	}
	
	return NULL;
}

static inline void __kdymo_destl_flush(void)
{
	struct list_head *pos, *tmp;

	list_for_each_safe(pos, tmp, &destl_head)
	{
		struct destl_entry *e = (struct destl_entry *) pos;
		
		list_del(&e->l);
		destl_len--;
		kfree(e);
	}
}

static inline int __kdymo_destl_add(struct destl_entry *e)
{
	if (destl_len >= DESTL_MAX_LEN)
	{
		printk(KERN_WARNING "kdymo_destl: max list length reached\n");
		return -ENOSPC;
	}

	list_add(&e->l, &destl_head);
	
	return 1;
}

static inline int __kdymo_destl_del(struct destl_entry *e)
{
	if (e == NULL)
		return 0;

	list_del(&e->l);

	return 1;
}

int kdymo_destl_get(u32 daddr, struct destl_entry *entry)
{
	struct destl_entry *e;
	int res = 0;
	
	read_lock_bh(&destl_lock);
	
	if ((e = __kdymo_destl_find(daddr)))
	{
		res = 1;
		if (entry)
			memcpy(entry, e, sizeof(struct destl_entry));
	}
	
	read_unlock_bh(&destl_lock);
	
	return res;
}

void kdymo_destl_flush(void)
{
	write_lock_bh(&destl_lock);
	
	__kdymo_destl_flush();
	
	write_unlock_bh(&destl_lock);
}

int kdymo_destl_add(u32 daddr)
{
	struct destl_entry *e;
	int status = 0;
	
	if (kdymo_destl_get(daddr, NULL))
		return 0;
	
	if ((e = kmalloc(sizeof(struct destl_entry), GFP_ATOMIC)) == NULL)
	{
		printk(KERN_ERR "kdymo_destl: OOM in kdymo_destl_add\n");
		return -ENOMEM;
	}
	e->daddr = daddr;
	
	write_lock_bh(&destl_lock);
	
	if ((status = __kdymo_destl_add(e)))
		destl_len++;
	
	write_unlock_bh(&destl_lock);
	
	if (status < 0)
		kfree(e);
	
	return status;
}

int kdymo_destl_del(u32 daddr)
{
	struct destl_entry *e;
	int res;
	
	write_lock_bh(&destl_lock); 
	
	if ((e = __kdymo_destl_find(daddr)) == NULL)
	{
		res = 0;
		goto unlock;
	}
	
	if ((res = __kdymo_destl_del(e)))
		kfree(e);
	
unlock:
	write_unlock_bh(&destl_lock);
	
	return res;
}

void kdymo_destl_init(void)
{
	destl_len = 0;
}

void kdymo_destl_fini(void)
{
	kdymo_destl_flush();
}
