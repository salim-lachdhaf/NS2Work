################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../dymoum-0.3/ns/dymo_um.cc \
../dymoum-0.3/ns/packet_queue.cc 

CC_DEPS += \
./dymoum-0.3/ns/dymo_um.d \
./dymoum-0.3/ns/packet_queue.d 

OBJS += \
./dymoum-0.3/ns/dymo_um.o \
./dymoum-0.3/ns/packet_queue.o 


# Each subdirectory must supply rules for building sources it contributes
dymoum-0.3/ns/%.o: ../dymoum-0.3/ns/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


