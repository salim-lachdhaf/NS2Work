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

#include <linux/module.h>
#include <linux/init.h>
#include <linux/version.h>
#include <linux/config.h>
#include <linux/types.h>
#include <linux/netdevice.h>
#include <linux/inetdevice.h>
#include <linux/netfilter.h>
#include <linux/netfilter_ipv4.h>
#include <linux/skbuff.h>
#include <linux/proc_fs.h>
#include <linux/ip.h>
#include <linux/udp.h>
#ifdef KERNEL26
#include <linux/moduleparam.h>
#endif	/* KERNEL26 */

#include "kdymo_destl.h"
#include "kdymo_queue.h"
#include "kdymo_netlink.h"


#define DYMO_PORT		653
#define DYMO_MAX_NR_INTERFACES	4

struct netdev_info
{
	u32	ip_addr;
	u32	bc_addr;
	int	ifindex;
};

static int nif;
static struct netdev_info netdevs[DYMO_MAX_NR_INTERFACES];
static char *ifnames[DYMO_MAX_NR_INTERFACES] = { "eth0" };

unsigned long pkts_dropped	= 0;
extern unsigned int queue_len;

#ifdef KERNEL26
static int num_parms = 0;
#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,10))
module_param_array(ifnames, charp, num_parms, 0444);
#else
module_param_array(ifnames, charp, &num_parms, 0444);
#endif
#else
MODULE_PARM(ifnames, "1-" __MODULE_STRING(MAX_INTERFACES) "s");
#endif

static unsigned int kdymo_hook(unsigned int hooknum,
				struct sk_buff **skb,
				const struct net_device *in,
				const struct net_device *out,
				int (*okfn) (struct sk_buff *));

/* These structs define which netfilter hooks we are interested in */
static struct nf_hook_ops kdymo_ops[] = {
{
	.hook		= kdymo_hook,
#ifdef KERNEL26
	.owner		= THIS_MODULE,
#endif	/* KERNEL26 */
	.pf		= PF_INET,
	.hooknum	= NF_IP_PRE_ROUTING,
	.priority	= NF_IP_PRI_FIRST
},
{
	.hook		= kdymo_hook,
#ifdef KERNEL26
	.owner		= THIS_MODULE,
#endif	/* KERNEL26 */
	.pf		= PF_INET,
	.hooknum	= NF_IP_LOCAL_OUT,
	.priority	= NF_IP_PRI_FIRST
},
{
	.hook		= kdymo_hook,
#ifdef KERNEL26
	.owner		= THIS_MODULE,
#endif	/* KERNEL26 */
	.pf		= PF_INET,
	.hooknum	= NF_IP_POST_ROUTING,
	.priority	= NF_IP_PRI_FIRST
}
};

/* Write information into a /proc file when it is read */
int kdymo_proc_info(char *buffer, char **start, off_t offset, int length)
{
	int len;
	
	len	= sprintf(buffer,
			"dropped pkts=%lu\nqueued pkts=%d\n",
			pkts_dropped, queue_len);
	*start	= buffer + offset;
	len	-= offset;
	
	if (len > length)
		len = length;
	else if (len < 0)
		len = 0;
	
	return len;
}

/* This function is called whenever a packet reaches one of the hooks we are
   interested in */
static unsigned int kdymo_hook(unsigned int hooknum,
				struct sk_buff **skb,
				const struct net_device *in,
				const struct net_device *out,
				int (*okfn) (struct sk_buff *))
{
	int i;
	struct destl_entry e;
	struct iphdr *iph = (*skb)->nh.iph;
	
	// If this is not an IP packet, let it go on
	if (iph == NULL)
		return NF_ACCEPT;
	
	// Broadcast and multicast packets are also accepted
	if (iph->daddr == INADDR_BROADCAST || IN_MULTICAST(ntohl(iph->daddr)))
		return NF_ACCEPT;
	for (i = 0; i < nif; i++)
		if (iph->daddr == netdevs[i].bc_addr)
			return NF_ACCEPT;
		
	// We want DYMO packets to directly go through the corresponding socket
	if (iph->protocol == IPPROTO_UDP)
	{
		struct udphdr *udph;
		
		udph = (struct udphdr *) ((char *) iph + (iph->ihl << 2));
		
		if (ntohs(udph->dest) == DYMO_PORT
			|| ntohs(udph->source) == DYMO_PORT)
			return NF_ACCEPT;
	}
	
	switch (hooknum)
	{
		case NF_IP_PRE_ROUTING:	// a received packet
		
		if (!in)
			break;
		
		// Check if the packet is bound to any enabled interface
		for (i = 0; i < DYMO_MAX_NR_INTERFACES; i++)
			if (netdevs[i].ifindex == in->ifindex)
			{
				// Update route to source
				kdymo_netlink_send_rtmsg(KDYMO_ROUTE_UPDATE,
					iph->saddr, in->ifindex);
				
				// Packets originated from or destined to this
				// node are accepted
				if (iph->saddr == netdevs[i].ip_addr ||
					iph->daddr == netdevs[i].ip_addr)
					return NF_ACCEPT;
				
				// Drop packets without a valid destination
				// route
				if (!kdymo_destl_get(iph->daddr, NULL))
				{
					kdymo_netlink_send_rtmsg(KDYMO_SEND_RERR,
						iph->daddr, in->ifindex);
					pkts_dropped++;
					return NF_DROP;
				}
				
				return NF_ACCEPT;
			}
		break;
		
		case NF_IP_LOCAL_OUT:	// a self-generated packet
		
		if (!out)
			break;
		
		// Check if the packet is bound to any enabled interface
		for (i = 0; i < DYMO_MAX_NR_INTERFACES; i++)
			if (netdevs[i].ifindex == out->ifindex)
			{
				// If there is a suitable route, the packet is
				// accepted. Otherwise it is buffered
				if (!kdymo_destl_get(iph->daddr, &e))
				{
					if (!kdymo_queue_find(iph->daddr))
						// start a route discovery
						kdymo_netlink_send_rtmsg(
							KDYMO_NOROUTE,
							iph->daddr,
							out->ifindex
						);
					kdymo_queue_enqueue(*skb, okfn);
					
					return NF_STOLEN;
				}
				
				return NF_ACCEPT;
			}
		break;
		
		case NF_IP_POST_ROUTING:	// an outgoing packet
		
		if (!out)
			break;
		
		// Check if the packet is bound to any enabled interface
		for (i = 0; i < DYMO_MAX_NR_INTERFACES; i++)
			if (netdevs[i].ifindex == out->ifindex)
			{
				// Update route to destination
				kdymo_netlink_send_rtmsg(KDYMO_ROUTE_UPDATE,
					iph->daddr, out->ifindex);
			}
		break;
	}
	
	return NF_ACCEPT;
}

/* Init function: set up netlink sockets, register all needed hooks and
   create a /proc element for DYMOUM */
static int __init kdymo_init(void)
{
	int i, ret;
	
	struct in_device *indev;
	struct net_device *dev	= NULL;
	struct in_ifaddr **ifap	= NULL;
	struct in_ifaddr *ifa	= NULL;
	
	kdymo_destl_init();
	
	ret = kdymo_queue_init();
	if (ret < 0)
		return ret;
	
	ret = kdymo_netlink_init();
	if (ret < 0)
		goto cleanup_queue;
	
	ret = nf_register_hook(&kdymo_ops[0]);
	if (ret < 0)
		goto cleanup_netlink;
	
	ret = nf_register_hook(&kdymo_ops[1]);
	if (ret < 0)
		goto cleanup_hook0;
	
	ret = nf_register_hook(&kdymo_ops[2]);
	if (ret < 0)
		goto cleanup_hook1;
	
	// Prefetch network device info
	for (i = 0; i < DYMO_MAX_NR_INTERFACES; i++)
	{
		if (!ifnames[i])
			break;
		
		if ((dev = dev_get_by_name(ifnames[i])) == NULL)
		{
			printk("No device %s available\n", ifnames[i]);
			continue;
		}
		
		netdevs[nif].ifindex = dev->ifindex;
		indev = in_dev_get(dev);
		
		if (indev)
		{
			for (ifap = &indev->ifa_list;
				(ifa = *ifap) != NULL;
				ifap = &ifa->ifa_next)
			{
				if (!strcmp(dev->name, ifa->ifa_label))
					break;
			}
			
			if (ifa)
			{
				netdevs[nif].ip_addr = ifa->ifa_address;
				netdevs[nif].bc_addr = ifa->ifa_broadcast;
			}
		}
		
		nif++;
		dev_put(dev);
	}
	
	proc_net_create("kdymo", 0, kdymo_proc_info);
	
	return ret;
	
cleanup_hook1:
	nf_unregister_hook(&kdymo_ops[1]);
cleanup_hook0:
	nf_unregister_hook(&kdymo_ops[0]);
cleanup_netlink:
	kdymo_netlink_fini();
cleanup_queue:
	kdymo_queue_fini();
	
	kdymo_destl_fini();

	return ret;
}

/* Exit function: unregister all hooks, remove /proc info for DYMO and ends
   netlink sockets operation */
static void __exit kdymo_exit(void)
{
	nf_unregister_hook(&kdymo_ops[2]);
	nf_unregister_hook(&kdymo_ops[1]);
	nf_unregister_hook(&kdymo_ops[0]);
	
	proc_net_remove("kdymo");
	
	kdymo_netlink_fini();
	kdymo_queue_fini();
	kdymo_destl_fini();
}

module_init(kdymo_init);
module_exit(kdymo_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Francisco J. Ros");
MODULE_DESCRIPTION("DYMOUM kernel support");
