################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../diffusion3/apps/rmst_examples/rmst_sink.cc \
../diffusion3/apps/rmst_examples/rmst_source.cc 

CC_DEPS += \
./diffusion3/apps/rmst_examples/rmst_sink.d \
./diffusion3/apps/rmst_examples/rmst_source.d 

OBJS += \
./diffusion3/apps/rmst_examples/rmst_sink.o \
./diffusion3/apps/rmst_examples/rmst_source.o 


# Each subdirectory must supply rules for building sources it contributes
diffusion3/apps/rmst_examples/%.o: ../diffusion3/apps/rmst_examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


