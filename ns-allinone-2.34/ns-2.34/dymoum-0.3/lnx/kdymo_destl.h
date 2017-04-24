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

#ifndef __KDYMO_DESTL_H__
#define __KDYMO_DESTL_H__

#ifdef __KERNEL__

#include <linux/list.h>
#include <linux/types.h>

/* List of destination addresses for which we have a valid route */

struct destl_entry
{
	struct list_head l;
	u32 daddr;
};

/* Initialize the list */
void kdymo_destl_init(void);

/* Destroy the list */
void kdymo_destl_fini(void);

/* Remove all elements from the list */
void kdymo_destl_flush(void);

/* Find an entry with the given address, and copy it in 'entry' if succesful */
int kdymo_destl_get(u32 daddr, struct destl_entry *entry);

/* Add a new entry in the list */
int kdymo_destl_add(u32 daddr);

/* Remove an entry from the list */
int kdymo_destl_del(u32 daddr);

#endif	/* __KERNEL__ */

#endif	/* __KDYMO_DESTL_H__ */
