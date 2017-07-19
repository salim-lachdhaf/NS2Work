################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../link/delay.cc \
../link/dynalink.cc \
../link/hackloss.cc 

CC_DEPS += \
./link/delay.d \
./link/dynalink.d \
./link/hackloss.d 

OBJS += \
./link/delay.o \
./link/dynalink.o \
./link/hackloss.o 


# Each subdirectory must supply rules for building sources it contributes
link/%.o: ../link/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


