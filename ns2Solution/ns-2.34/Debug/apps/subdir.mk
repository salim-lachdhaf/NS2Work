################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../apps/app.cc \
../apps/pbc.cc \
../apps/ping.cc \
../apps/rtp.cc \
../apps/sctp_app1.cc \
../apps/telnet.cc \
../apps/udp.cc \
../apps/vatrcvr.cc \
../apps/worm.cc 

CC_DEPS += \
./apps/app.d \
./apps/pbc.d \
./apps/ping.d \
./apps/rtp.d \
./apps/sctp_app1.d \
./apps/telnet.d \
./apps/udp.d \
./apps/vatrcvr.d \
./apps/worm.d 

OBJS += \
./apps/app.o \
./apps/pbc.o \
./apps/ping.o \
./apps/rtp.o \
./apps/sctp_app1.o \
./apps/telnet.o \
./apps/udp.o \
./apps/vatrcvr.o \
./apps/worm.o 


# Each subdirectory must supply rules for building sources it contributes
apps/%.o: ../apps/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


