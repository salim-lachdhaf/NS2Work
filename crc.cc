#include <inttypes.h>
#include <stdio.h>
#include <string.h>
 
uint32_t rc_crc32(uint32_t crc, const uint32_t val){
    char aux[32];
    sprintf(aux,"%u", val);
    size_t len= strlen(aux);
    static uint32_t table[256];
    static int have_table = 0;
    uint32_t rem;
    uint8_t octet;
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
 
int main()
{
	printf("%" PRIX32 "\n", rc_crc32(0,rc_crc32(0,123456789)));
 
	return 0;
}