################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../diffusion3/apps/gear_examples/gear_common.cc \
../diffusion3/apps/gear_examples/gear_receiver.cc \
../diffusion3/apps/gear_examples/gear_sender.cc 

CC_DEPS += \
./diffusion3/apps/gear_examples/gear_common.d \
./diffusion3/apps/gear_examples/gear_receiver.d \
./diffusion3/apps/gear_examples/gear_sender.d 

OBJS += \
./diffusion3/apps/gear_examples/gear_common.o \
./diffusion3/apps/gear_examples/gear_receiver.o \
./diffusion3/apps/gear_examples/gear_sender.o 


# Each subdirectory must supply rules for building sources it contributes
diffusion3/apps/gear_examples/%.o: ../diffusion3/apps/gear_examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


