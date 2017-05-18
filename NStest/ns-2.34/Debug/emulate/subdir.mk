################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../emulate/arp.cc \
../emulate/ether.cc \
../emulate/icmp.cc \
../emulate/internet.cc \
../emulate/iptap.cc \
../emulate/nat.cc \
../emulate/net-ip.cc \
../emulate/net-pcap.cc \
../emulate/net.cc \
../emulate/ping_responder.cc \
../emulate/tap.cc \
../emulate/tcptap.cc 

C_SRCS += \
../emulate/inet.c 

CC_DEPS += \
./emulate/arp.d \
./emulate/ether.d \
./emulate/icmp.d \
./emulate/internet.d \
./emulate/iptap.d \
./emulate/nat.d \
./emulate/net-ip.d \
./emulate/net-pcap.d \
./emulate/net.d \
./emulate/ping_responder.d \
./emulate/tap.d \
./emulate/tcptap.d 

OBJS += \
./emulate/arp.o \
./emulate/ether.o \
./emulate/icmp.o \
./emulate/inet.o \
./emulate/internet.o \
./emulate/iptap.o \
./emulate/nat.o \
./emulate/net-ip.o \
./emulate/net-pcap.o \
./emulate/net.o \
./emulate/ping_responder.o \
./emulate/tap.o \
./emulate/tcptap.o 

C_DEPS += \
./emulate/inet.d 


# Each subdirectory must supply rules for building sources it contributes
emulate/%.o: ../emulate/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

emulate/%.o: ../emulate/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


