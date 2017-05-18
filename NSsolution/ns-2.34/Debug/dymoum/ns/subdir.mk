################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../dymoum/ns/dymo_um.cc \
../dymoum/ns/packet_queue.cc 

CC_DEPS += \
./dymoum/ns/dymo_um.d \
./dymoum/ns/packet_queue.d 

OBJS += \
./dymoum/ns/dymo_um.o \
./dymoum/ns/packet_queue.o 


# Each subdirectory must supply rules for building sources it contributes
dymoum/ns/%.o: ../dymoum/ns/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


