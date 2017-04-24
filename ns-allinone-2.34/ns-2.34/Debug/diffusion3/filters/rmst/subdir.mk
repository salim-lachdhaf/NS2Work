################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../diffusion3/filters/rmst/rmst.cc \
../diffusion3/filters/rmst/rmst_filter.cc 

CC_DEPS += \
./diffusion3/filters/rmst/rmst.d \
./diffusion3/filters/rmst/rmst_filter.d 

OBJS += \
./diffusion3/filters/rmst/rmst.o \
./diffusion3/filters/rmst/rmst_filter.o 


# Each subdirectory must supply rules for building sources it contributes
diffusion3/filters/rmst/%.o: ../diffusion3/filters/rmst/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


