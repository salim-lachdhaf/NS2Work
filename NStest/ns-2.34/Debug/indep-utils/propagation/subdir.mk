################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../indep-utils/propagation/threshold.cc 

CC_DEPS += \
./indep-utils/propagation/threshold.d 

OBJS += \
./indep-utils/propagation/threshold.o 


# Each subdirectory must supply rules for building sources it contributes
indep-utils/propagation/%.o: ../indep-utils/propagation/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


