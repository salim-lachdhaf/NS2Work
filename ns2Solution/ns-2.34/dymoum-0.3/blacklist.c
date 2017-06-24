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

#ifdef NS_PORT
#include "ns/dymo_um.h"
#include <errno.h>
#else
#include "blacklist.h"
#include "debug.h"

#include <stdlib.h>
#include <errno.h>

static DLIST_HEAD(HOLEBLACKLIST);
static DLIST_HEAD(BLACKLIST);

#endif	/* NS_PORT */

blacklist_t *NS_CLASS blacklist_add(struct in_addr addr){
	blacklist_t *entry;
	
	if ((entry = (blacklist_t *)malloc(sizeof(blacklist_t))) == NULL)
	{
		dlog(LOG_ERR, errno, __FUNCTION__, "failed malloc()");
		exit(EXIT_FAILURE);
	}
	
	entry->addr.s_addr	= addr.s_addr;
	dlist_add(&entry->list_head, &BLACKLIST);
	
	return entry;
}

///////////////////////////////////////////////////////////Black Hole add to black list////////////////////////////////////////
void NS_CLASS BlackHoleblacklist_add(struct in_addr addr){
	BlackHoleblacklist_t *entry;
	
	if ((entry = (BlackHoleblacklist_t *)malloc(sizeof(BlackHoleblacklist_t))) == NULL)
	{
		dlog(LOG_ERR, errno, __FUNCTION__, "failed malloc()");
		exit(EXIT_FAILURE);
	}
	
	entry->addr.s_addr	= addr.s_addr;
	dlist_add(&entry->list_head, &HOLEBLACKLIST);
	printf("%u added to black list \n",addr.s_addr);

	//return entry;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int NS_CLASS blacklist_remove(blacklist_t *entry)
{
	if (!entry)
		return 0;
	
	dlist_del(&entry->list_head);
	timer_remove(&entry->timer);
	
	free(entry);
	
	return 1;
}

/////////////////////Check for the existing of black hole in black hole black list/////////////////////////////////////////////
bool NS_CLASS BlackHoleblacklist_find(struct in_addr addr){
	dlist_head_t *pos;
	
	dlist_for_each(pos, &HOLEBLACKLIST)
	{
		BlackHoleblacklist_t *entry = (BlackHoleblacklist_t *) pos;
		if (entry->addr.s_addr == addr.s_addr)
			return true;
	}
	
	return false;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


blacklist_t *NS_CLASS blacklist_find(struct in_addr addr){
	dlist_head_t *pos;
	
	dlist_for_each(pos, &BLACKLIST)
	{
		blacklist_t *entry = (blacklist_t *) pos;
		if (entry->addr.s_addr == addr.s_addr)
			return entry;
	}
	
	return NULL;
}
