################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../satellite/sat-hdlc.cc \
../satellite/satgeometry.cc \
../satellite/sathandoff.cc \
../satellite/satlink.cc \
../satellite/satnode.cc \
../satellite/satposition.cc \
../satellite/satroute.cc \
../satellite/sattrace.cc 

CC_DEPS += \
./satellite/sat-hdlc.d \
./satellite/satgeometry.d \
./satellite/sathandoff.d \
./satellite/satlink.d \
./satellite/satnode.d \
./satellite/satposition.d \
./satellite/satroute.d \
./satellite/sattrace.d 

OBJS += \
./satellite/sat-hdlc.o \
./satellite/satgeometry.o \
./satellite/sathandoff.o \
./satellite/satlink.o \
./satellite/satnode.o \
./satellite/satposition.o \
./satellite/satroute.o \
./satellite/sattrace.o 


# Each subdirectory must supply rules for building sources it contributes
satellite/%.o: ../satellite/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


