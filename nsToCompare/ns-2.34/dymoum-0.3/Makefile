# Source files
SRC = debug.c dymo_generic.c dymo_netlink.c dymo_re.c dymo_socket.c \
      dymo_timeout.c dymo_uerr.c dymo_rerr.c k_route.c rtable.c \
      timer_queue.c main.c pending_rreq.c icmp_socket.c blacklist.c \
      dymo_nb.c dymo_hello.c

SRC_NS = debug.c dymo_generic.c dymo_re.c dymo_socket.c dymo_timeout.c \
         dymo_uerr.c dymo_rerr.c rtable.c timer_queue.c pending_rreq.c \
         icmp_socket.c blacklist.c dymo_nb.c dymo_hello.c

SRC_NS_CPP = ns/dymo_um.cc ns/packet_queue.cc

# Object files
OBJS = $(SRC:%.c=%.o)
OBJS_NS = $(SRC_NS:%.c=%-ns.o)
OBJS_NS_CPP = $(SRC_NS_CPP:%.cc=%-ns.o)

# Kernel stuff
KERNEL=$(shell uname -r)
KERNEL_DIR=/lib/modules/$(KERNEL)/build
KERNEL_INC=$(KERNEL_DIR)/include

# Compiler options
CC= gcc
CPP= g++
C_OPTS= -Wall -O3
CPP_OPTS= -Wall

export CC

DEBUG= -g -O0 -DDEBUG
DEFS=
LD_OPTS=
CFLAGS= $(C_OPTS) $(DEBUG) $(DEFS)

NS_DEFS= # DON'T CHANGE (overridden by NS Makefile)
NS_CFLAGS=$(OPTS) $(CPP_OPTS) $(DEBUG) $(NS_DEFS)
NS_INC= # DON'T CHANGE (overridden by NS Makefile)
NS_TARGET=libdymoum.a

# Archiver and options
AR=ar
AR_FLAGS=rc

.PHONY: default clean install uninstall depend kdymo

# Targets
default: dymod kdymo

$(OBJS): %.o: %.c Makefile
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJS_NS): %-ns.o: %.c Makefile
	$(CPP) $(NS_CFLAGS) $(NS_INC) -c -o $@ $<

$(OBJS_NS_CPP): %-ns.o: %.cc Makefile
	$(CPP) $(NS_CFLAGS) $(NS_INC) -c -o $@ $<

$(NS_TARGET): $(OBJS_NS_CPP) $(OBJS_NS)
	$(AR) $(AR_FLAGS) $@ $(OBJS_NS_CPP) $(OBJS_NS) > /dev/null

dymod: $(OBJS) Makefile
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LD_OPTS)

kdymo:
	$(MAKE) -C lnx KERNEL_DIR=$(KERNEL_DIR) KCC=$(CC)

depend:
	@echo "Updating Makefile dependencies..."
	@makedepend -Y./ -- $(DEFS) -- $(SRC) &>/dev/null
	@makedepend -a -Y./ -- $(KDEFS) kdymo.c &>/dev/null

install: default
	install -s -m 755 dymod /usr/sbin/dymod
	
	@if [ ! -d /lib/modules/$(KERNEL)/dymo ]; then \
		mkdir /lib/modules/$(KERNEL)/dymo; \
	fi
	@echo "Installing kernel module in /lib/modules/$(KERNEL)/dymo/";
	@if [ -f ./kdymo.ko ]; then \
		install -m 644 kdymo.ko /lib/modules/$(KERNEL)/dymo/kdymo.ko; \
	else \
		install -m 644 kdymo.o /lib/modules/$(KERNEL)/dymo/kdymo.o; \
	fi
	/sbin/depmod -a

uninstall:
	rm -f /usr/sbin/dymod
	rm -rf /lib/modules/$(KERNEL)/dymo

clean:
	rm -f dymod *~ *.o *.ko core *.log $(NS_TARGET) ns/*.o ns/*~
	cd lnx && $(MAKE) clean
