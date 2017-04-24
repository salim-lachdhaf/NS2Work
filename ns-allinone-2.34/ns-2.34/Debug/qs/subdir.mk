################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../qs/hdr_qs.cc \
../qs/qsagent.cc 

CC_DEPS += \
./qs/hdr_qs.d \
./qs/qsagent.d 

OBJS += \
./qs/hdr_qs.o \
./qs/qsagent.o 


# Each subdirectory must supply rules for building sources it contributes
qs/%.o: ../qs/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


