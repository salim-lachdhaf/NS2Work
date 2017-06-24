#ifndef __WORK_H__
#define __WORK_H__


#ifndef NS_NO_GLOBALS

#include <sys/types.h>
#include <netinet/in.h>


#endif	/* NS_NO_GLOBALS */

#ifndef NS_NO_DECLARATIONS



    bool BLACKHOLE; //BALCK HOLE

	u_int32_t rc_crc32(u_int32_t crc, const u_int32_t val);//crc

    rtable_entry_t *rtable_findGetOriginalAddress(struct in_addr dest_addr); //check for the real @ and return it




#endif	/* NS_NO_DECLARATIONS */

#endif	/* __RTABLE_H__ */