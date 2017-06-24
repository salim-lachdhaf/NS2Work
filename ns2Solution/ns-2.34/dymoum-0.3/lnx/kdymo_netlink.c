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

#include <linux/skbuff.h>
#include <linux/netlink.h>
#include <linux/spinlock.h>
#include <asm/semaphore.h>
#include <net/sock.h>
#ifdef KERNEL26
#include <linux/security.h>
#endif	/* KERNEL26 */

#include "kdymo_netlink.h"
#include "kdymo_queue.h"
#include "kdymo_destl.h"

// For 2.4 backwards compatibility
#ifndef KERNEL26
#define sk_receive_queue receive_queue 
#define sk_socket socket
#endif	/* KERNEL26 */

// TODO: maybe peer_pid stuff is not needed, since all messages are bcasted

extern unsigned long pkts_dropped;

static int peer_pid;
static struct sock *nl_sock;
static DECLARE_MUTEX(nl_sem);

static void kdymo_netlink_rcv_sk(struct sock *sk, int len);
static inline void kdymo_netlink_rcv_skb(struct sk_buff *skb);
static int kdymo_netlink_rcv_event(struct notifier_block *this,
	unsigned long event, void *ptr);
static int kdymo_netlink_rcv_peer(unsigned char type, void *msg,
	unsigned int len);

static struct notifier_block kdymo_nl_notifier = {
	.notifier_call = kdymo_netlink_rcv_event,
};

/* Return a socket buffer containing the message 'm' (a kdymo_rtmsg in our
   case) */
static struct sk_buff *kdymo_netlink_create_msg(int type, void *m, int len)
{
	unsigned char *old_tail;
	struct sk_buff *skb;
	struct nlmsghdr *nlh;
	struct kdymo_rtmsg *msg;
	size_t size = 0;
	
	size = NLMSG_SPACE(len);
	
	if ((skb = alloc_skb(size, GFP_ATOMIC)) == NULL)
		goto nlmsg_failure;
	
	old_tail = skb->tail;
	nlh = NLMSG_PUT(skb, 0, 0, type, size - sizeof(struct nlmsghdr));
	msg = NLMSG_DATA(nlh);
	
	memcpy(msg, m, len);
	nlh->nlmsg_len = skb->tail - old_tail;
	
	return skb;
	
nlmsg_failure:	// NLMSG_PUT makes me use this label
	if (skb)
		kfree_skb(skb);
	
	printk(KERN_ERR "kdymo: error creating netlink message\n");
	return NULL;
}

void kdymo_netlink_send_rtmsg(int type, __u32 addr, int ifindex)
{
	struct sk_buff *skb;
	struct kdymo_rtmsg msg;
	
	msg.addr	= addr;
	msg.ifindex	= ifindex;
	
	skb = kdymo_netlink_create_msg(type, &msg, sizeof(struct kdymo_rtmsg));
	if (skb == NULL)
		return;
	
	if (netlink_broadcast(nl_sock, skb, 0, DYMOGRP_NOTIFY, GFP_USER) < 0)
		printk("could not send netlink bcast msg, type = %d\n", type);
}

int kdymo_netlink_init(void)
{
	netlink_register_notifier(&kdymo_nl_notifier);
	
	nl_sock = netlink_kernel_create(NETLINK_DYMO, kdymo_netlink_rcv_sk);
	if (nl_sock == NULL)
	{
		printk(KERN_ERR "failed to create netlink socket");
		netlink_unregister_notifier(&kdymo_nl_notifier);
		return -1;
	}
	
	return 1;
}

void kdymo_netlink_fini(void)
{
	sock_release(nl_sock->sk_socket);
	
	down(&nl_sem);
	up(&nl_sem);
	
	netlink_unregister_notifier(&kdymo_nl_notifier);
}

static int kdymo_netlink_rcv_event(struct notifier_block *this,
	unsigned long event, void *ptr)
{
	struct netlink_notify *n = ptr;
	
	if (event == NETLINK_URELEASE &&
		n->protocol == NETLINK_DYMO && n->pid)
	{
		if (n->pid == peer_pid)
		{
			peer_pid = 0;
			kdymo_destl_flush();
			kdymo_queue_flush();
		}
		
		return NOTIFY_DONE;
	}
	
	return NOTIFY_DONE;
}

static void kdymo_netlink_rcv_sk(struct sock *sk, int len)
{
	do
	{
		struct sk_buff *skb;
		
		if (down_trylock(&nl_sem))
			return;
		
		while ((skb = skb_dequeue(&sk->sk_receive_queue)) != NULL)
		{
			kdymo_netlink_rcv_skb(skb);
			kfree_skb(skb);
		}
		
		up(&nl_sem);
	} while (nl_sock && nl_sock->sk_receive_queue.qlen);
	
	return;
}

#define RCV_SKB_FAIL(err) do {netlink_ack(skb, nlh, (err)); return;} while (0)
static inline void kdymo_netlink_rcv_skb(struct sk_buff *skb)
{
	int status, type, pid, flags, nlmsglen, skblen;
	struct nlmsghdr *nlh;
	
	if ((skblen = skb->len) < sizeof(struct nlmsghdr))
	{
	    printk("skblen too small\n");
	    return;
	}
	
	nlh		= (struct nlmsghdr *) skb->data;
	nlmsglen	= nlh->nlmsg_len;
	if (nlmsglen < sizeof(*nlh) || skblen < nlmsglen)
	{
		printk("nlsmsg=%d skblen=%d too small\n", nlmsglen, skblen);
		return;
	}
	
	pid	= nlh->nlmsg_pid;
	flags	= nlh->nlmsg_flags;
	if (pid <= 0 || !(flags & NLM_F_REQUEST) || flags & NLM_F_MULTI)
		RCV_SKB_FAIL(-EINVAL);
	if (flags & MSG_TRUNC)
		RCV_SKB_FAIL(-ECOMM);
	
	type = nlh->nlmsg_type;

#ifdef KERNEL26
	if (security_netlink_recv(skb))
		RCV_SKB_FAIL(-EPERM);
#endif	/* KERNEL26 */
	
	if (peer_pid)
	{
		if (peer_pid != pid)
			RCV_SKB_FAIL(-EBUSY);
	}
	else
		peer_pid = pid;
	
	status = kdymo_netlink_rcv_peer(type, NLMSG_DATA(nlh),
		skblen - NLMSG_LENGTH(0));
	if (status < 0)
		RCV_SKB_FAIL(status);
	
	if (flags & NLM_F_ACK)
		netlink_ack(skb, nlh, 0);
}

/* Process messages coming from user space */
static int kdymo_netlink_rcv_peer(unsigned char type, void *msg,
	unsigned int len)
{
	int status = 0;
	struct kdymo_rtmsg *rtm = (struct kdymo_rtmsg *) msg;
	
	if (len < sizeof(*msg))
		return -EINVAL;
	
	switch (type)
	{
		case KDYMO_ADDROUTE:
			kdymo_destl_add(rtm->addr);
			kdymo_queue_set_verdict(KDYMO_QUEUE_SEND, rtm->addr);
			break;
			
		case KDYMO_DELROUTE:  
			kdymo_destl_del(rtm->addr);
			pkts_dropped +=
				kdymo_queue_set_verdict(KDYMO_QUEUE_DROP, rtm->addr);
			break;
			
		case KDYMO_NOROUTE_FOUND:
			pkts_dropped +=
				kdymo_queue_set_verdict(KDYMO_QUEUE_DROP, rtm->addr);
			break;
		
		default:
			status = -EINVAL;
	}
	
	return status;
}
