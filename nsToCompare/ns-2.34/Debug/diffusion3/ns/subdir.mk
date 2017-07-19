################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../diffusion3/ns/diffagent.cc \
../diffusion3/ns/diffrtg.cc \
../diffusion3/ns/difftimer.cc 

CC_DEPS += \
./diffusion3/ns/diffagent.d \
./diffusion3/ns/diffrtg.d \
./diffusion3/ns/difftimer.d 

OBJS += \
./diffusion3/ns/diffagent.o \
./diffusion3/ns/diffrtg.o \
./diffusion3/ns/difftimer.o 


# Each subdirectory must supply rules for building sources it contributes
diffusion3/ns/%.o: ../diffusion3/ns/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


