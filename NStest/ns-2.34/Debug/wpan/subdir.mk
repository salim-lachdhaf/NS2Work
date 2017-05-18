################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../wpan/p802_15_4csmaca.cc \
../wpan/p802_15_4fail.cc \
../wpan/p802_15_4hlist.cc \
../wpan/p802_15_4mac.cc \
../wpan/p802_15_4nam.cc \
../wpan/p802_15_4phy.cc \
../wpan/p802_15_4sscs.cc \
../wpan/p802_15_4timer.cc \
../wpan/p802_15_4trace.cc \
../wpan/p802_15_4transac.cc 

CC_DEPS += \
./wpan/p802_15_4csmaca.d \
./wpan/p802_15_4fail.d \
./wpan/p802_15_4hlist.d \
./wpan/p802_15_4mac.d \
./wpan/p802_15_4nam.d \
./wpan/p802_15_4phy.d \
./wpan/p802_15_4sscs.d \
./wpan/p802_15_4timer.d \
./wpan/p802_15_4trace.d \
./wpan/p802_15_4transac.d 

OBJS += \
./wpan/p802_15_4csmaca.o \
./wpan/p802_15_4fail.o \
./wpan/p802_15_4hlist.o \
./wpan/p802_15_4mac.o \
./wpan/p802_15_4nam.o \
./wpan/p802_15_4phy.o \
./wpan/p802_15_4sscs.o \
./wpan/p802_15_4timer.o \
./wpan/p802_15_4trace.o \
./wpan/p802_15_4transac.o 


# Each subdirectory must supply rules for building sources it contributes
wpan/%.o: ../wpan/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


