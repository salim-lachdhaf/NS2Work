################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../diffusion3/filters/diffusion/one_phase_pull.cc \
../diffusion3/filters/diffusion/two_phase_pull.cc 

CC_DEPS += \
./diffusion3/filters/diffusion/one_phase_pull.d \
./diffusion3/filters/diffusion/two_phase_pull.d 

OBJS += \
./diffusion3/filters/diffusion/one_phase_pull.o \
./diffusion3/filters/diffusion/two_phase_pull.o 


# Each subdirectory must supply rules for building sources it contributes
diffusion3/filters/diffusion/%.o: ../diffusion3/filters/diffusion/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


