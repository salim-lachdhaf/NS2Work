################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../indep-utils/dosreduce/dosreduce.c 

OBJS += \
./indep-utils/dosreduce/dosreduce.o 

C_DEPS += \
./indep-utils/dosreduce/dosreduce.d 


# Each subdirectory must supply rules for building sources it contributes
indep-utils/dosreduce/%.o: ../indep-utils/dosreduce/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


