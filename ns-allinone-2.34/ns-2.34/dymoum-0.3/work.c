#ifdef NS_PORT
#include "ns/dymo_um.h"
#else
#include "work.h"
#include <stdlib.h>

//////////////////////////////////////////CRC 32 Calc///////////////////////////////////////
u_int32_t NS_CLASS rc_crc32(u_int32_t crc, const u_int32_t val){
    char aux[32];
    //printf(aux,"%u", val);
    size_t len= strlen(aux);
    static u_int32_t table[256];
    static int have_table = 0;
    u_int32_t rem;
    u_int8_t octet;
    int i, j;
    const char *p, *q;

    /* This check is not thread safe; there is no mutex. */
    if (have_table == 0) {
            /* Calculate CRC table. */
            for (i = 0; i < 256; i++) {
                    rem = i;  /* remainder from polynomial division */
                    for (j = 0; j < 8; j++) {
                            if (rem & 1) {
                                    rem >>= 1;
                                    rem ^= 0xedb88320;
                            } else
                                    rem >>= 1;
                    }
                    table[i] = rem;
            }
            have_table = 1;
    }

    crc = ~crc;
    q = aux + len;
    for (p = aux; p < q; p++) {
            octet = *p;  /* Cast to unsigned octet. */
            crc = (crc >> 8) ^ table[(crc & 0xff) ^ octet];
    }
    return ~crc;
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////Get The @ of the CRC/////////////////////////////////////
rtable_entry_t *NS_CLASS rtable_findGetOriginalAddress(struct in_addr dest_addr){
	dlist_head_t *pos;
	
	dlist_for_each(pos, &rtable.l)
	{
		rtable_entry_t *e = (rtable_entry_t *) pos;
		if (rc_crc32(0,e->rt_dest_addr.s_addr) == dest_addr.s_addr)
			return e;
	}
	return NULL;
}
/////////////////////////////////////////////////////////////////////////////////////////////
