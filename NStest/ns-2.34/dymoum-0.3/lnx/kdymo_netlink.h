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

#ifndef __KDYMO_NETLINK_H__
#define __KDYMO_NETLINK_H__

#include <linux/types.h>

/* 12 was free last time I checked <linux/netlink.h> */
#define NETLINK_DYMO	12
#define DYMOGRP_NOTIFY	1

#define KDYMO_BASE		0x00
#define KDYMO_ADDROUTE		(KDYMO_BASE +1)
#define KDYMO_DELROUTE		(KDYMO_BASE +2)
#define KDYMO_NOROUTE_FOUND	(KDYMO_BASE +3)
#define KDYMO_NOROUTE		(KDYMO_BASE +4)
#define KDYMO_ROUTE_UPDATE	(KDYMO_BASE +5)
#define KDYMO_SEND_RERR		(KDYMO_BASE +6)

struct kdymo_rtmsg
{
	__u32	addr;
	int	ifindex;
};

#ifdef __KERNEL__

/* Implementation of the communication from kernel space to user space via
   netlink sockets */

/* Set up netlink socket */
int kdymo_netlink_init(void);

/* Close netlink socket */
void kdymo_netlink_fini(void);

/* Send a message to user space */
void kdymo_netlink_send_rtmsg(int type, __u32 addr, int ifindex);

#endif	/* __KERNEL__ */

#endif	/* __KDYMO_NETLINK_H__ */
