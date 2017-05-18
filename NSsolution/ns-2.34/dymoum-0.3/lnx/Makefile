ifneq (,$(findstring 2.6,$(KERNELRELEASE)))
EXTRA_CFLAGS += -D KERNEL26
obj-m += kdymo.o
kdymo-objs := kdymo_main.o kdymo_netlink.o kdymo_queue.o kdymo_destl.o
else

KOBJS := kdymo_main.o kdymo_netlink.o kdymo_queue.o kdymo_destl.o

KERNEL=$(shell uname -r)
KERNEL_DIR=/lib/modules/$(KERNEL)/build
KERNEL_INC=$(KERNEL_DIR)/include

KCC=gcc
LD=ld

VERSION=$(shell if [ ! -d $(KERNEL_DIR) ]; then echo "No linux source found!!! Check your setup..."; exit; fi; grep ^VERSION $(KERNEL_DIR)/Makefile | cut -d' ' -f 3)
PATCHLEVEL=$(shell grep ^PATCHLEVEL $(KERNEL_DIR)/Makefile | cut -d' ' -f 3)
SUBLEVEL=$(shell grep ^SUBLEVEL $(KERNEL_DIR)/Makefile | cut -d' ' -f 3)

KINC=-nostdinc -DMODVERSIONS -include $(KERNEL_INC)/linux/modversions.h $(shell $(CC) -print-search-dirs | sed -ne 's/install: \(.*\)/-I \1include/gp') -I$(KERNEL_INC)
KDEFS=-D__KERNEL__ -DMODULE
KCFLAGS=-Wall -Wno-strict-aliasing -O2 $(KDEFS) $(KINC)

.PHONY: clean

ifeq ($(PATCHLEVEL),6)
default: kdymo.ko
else 
default: kdymo.o
endif

$(KOBJS): %.o: %.c Makefile
	$(KCC) $(KCFLAGS) -c -o $@ $<

kdymo.o: $(KOBJS) Makefile
	$(LD) -r $(KOBJS) -o $@
	cp $@ ../

kdymo.ko: $(KOBJS:%.o=%.c) Makefile
	$(MAKE) -C $(KERNEL_DIR) SUBDIRS=$(PWD)/lnx modules
	cp $@ ../

clean:
	rm -rf *.o *.ko *.mod.* *~ *.o.cmd

endif
