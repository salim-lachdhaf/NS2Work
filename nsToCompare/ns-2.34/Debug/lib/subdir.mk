################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../lib/dmalloc_support.cc \
../lib/int.RVec.cc \
../lib/int.Vec.cc 

CC_DEPS += \
./lib/dmalloc_support.d \
./lib/int.RVec.d \
./lib/int.Vec.d 

OBJS += \
./lib/dmalloc_support.o \
./lib/int.RVec.o \
./lib/int.Vec.o 


# Each subdirectory must supply rules for building sources it contributes
lib/%.o: ../lib/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


