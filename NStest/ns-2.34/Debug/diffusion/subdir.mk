################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../diffusion/diff_prob.cc \
../diffusion/diff_rate.cc \
../diffusion/diff_sink.cc \
../diffusion/diffusion.cc \
../diffusion/flooding.cc \
../diffusion/hash_table.cc \
../diffusion/iflist.cc \
../diffusion/omni_mcast.cc \
../diffusion/routing_table.cc 

CC_DEPS += \
./diffusion/diff_prob.d \
./diffusion/diff_rate.d \
./diffusion/diff_sink.d \
./diffusion/diffusion.d \
./diffusion/flooding.d \
./diffusion/hash_table.d \
./diffusion/iflist.d \
./diffusion/omni_mcast.d \
./diffusion/routing_table.d 

OBJS += \
./diffusion/diff_prob.o \
./diffusion/diff_rate.o \
./diffusion/diff_sink.o \
./diffusion/diffusion.o \
./diffusion/flooding.o \
./diffusion/hash_table.o \
./diffusion/iflist.o \
./diffusion/omni_mcast.o \
./diffusion/routing_table.o 


# Each subdirectory must supply rules for building sources it contributes
diffusion/%.o: ../diffusion/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


