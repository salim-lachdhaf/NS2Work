################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../mac/arp.cc \
../mac/channel.cc \
../mac/lanRouter.cc \
../mac/ll.cc \
../mac/mac-802_11.cc \
../mac/mac-802_11Ext.cc \
../mac/mac-802_3.cc \
../mac/mac-csma.cc \
../mac/mac-multihop.cc \
../mac/mac-simple.cc \
../mac/mac-tdma.cc \
../mac/mac-timers.cc \
../mac/mac.cc \
../mac/phy.cc \
../mac/smac.cc \
../mac/varp.cc \
../mac/wired-phy.cc \
../mac/wireless-phy.cc \
../mac/wireless-phyExt.cc 

CC_DEPS += \
./mac/arp.d \
./mac/channel.d \
./mac/lanRouter.d \
./mac/ll.d \
./mac/mac-802_11.d \
./mac/mac-802_11Ext.d \
./mac/mac-802_3.d \
./mac/mac-csma.d \
./mac/mac-multihop.d \
./mac/mac-simple.d \
./mac/mac-tdma.d \
./mac/mac-timers.d \
./mac/mac.d \
./mac/phy.d \
./mac/smac.d \
./mac/varp.d \
./mac/wired-phy.d \
./mac/wireless-phy.d \
./mac/wireless-phyExt.d 

OBJS += \
./mac/arp.o \
./mac/channel.o \
./mac/lanRouter.o \
./mac/ll.o \
./mac/mac-802_11.o \
./mac/mac-802_11Ext.o \
./mac/mac-802_3.o \
./mac/mac-csma.o \
./mac/mac-multihop.o \
./mac/mac-simple.o \
./mac/mac-tdma.o \
./mac/mac-timers.o \
./mac/mac.o \
./mac/phy.o \
./mac/smac.o \
./mac/varp.o \
./mac/wired-phy.o \
./mac/wireless-phy.o \
./mac/wireless-phyExt.o 


# Each subdirectory must supply rules for building sources it contributes
mac/%.o: ../mac/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


