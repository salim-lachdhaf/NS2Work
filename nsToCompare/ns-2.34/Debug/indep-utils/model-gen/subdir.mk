################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../indep-utils/model-gen/http_active.c \
../indep-utils/model-gen/http_connect.c 

OBJS += \
./indep-utils/model-gen/http_active.o \
./indep-utils/model-gen/http_connect.o 

C_DEPS += \
./indep-utils/model-gen/http_active.d \
./indep-utils/model-gen/http_connect.d 


# Each subdirectory must supply rules for building sources it contributes
indep-utils/model-gen/%.o: ../indep-utils/model-gen/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


