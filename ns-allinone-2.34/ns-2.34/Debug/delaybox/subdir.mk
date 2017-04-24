################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../delaybox/delaybox.cc 

CC_DEPS += \
./delaybox/delaybox.d 

OBJS += \
./delaybox/delaybox.o 


# Each subdirectory must supply rules for building sources it contributes
delaybox/%.o: ../delaybox/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


