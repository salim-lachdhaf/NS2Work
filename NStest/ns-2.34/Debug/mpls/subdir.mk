################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../mpls/classifier-addr-mpls.cc \
../mpls/ldp.cc \
../mpls/mpls-module.cc 

CC_DEPS += \
./mpls/classifier-addr-mpls.d \
./mpls/ldp.d \
./mpls/mpls-module.d 

OBJS += \
./mpls/classifier-addr-mpls.o \
./mpls/ldp.o \
./mpls/mpls-module.o 


# Each subdirectory must supply rules for building sources it contributes
mpls/%.o: ../mpls/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


