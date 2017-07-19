################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../diffusion3/lib/main/attrs.cc \
../diffusion3/lib/main/events.cc \
../diffusion3/lib/main/iodev.cc \
../diffusion3/lib/main/iohook.cc \
../diffusion3/lib/main/message.cc \
../diffusion3/lib/main/timers.cc \
../diffusion3/lib/main/tools.cc 

CC_DEPS += \
./diffusion3/lib/main/attrs.d \
./diffusion3/lib/main/events.d \
./diffusion3/lib/main/iodev.d \
./diffusion3/lib/main/iohook.d \
./diffusion3/lib/main/message.d \
./diffusion3/lib/main/timers.d \
./diffusion3/lib/main/tools.d 

OBJS += \
./diffusion3/lib/main/attrs.o \
./diffusion3/lib/main/events.o \
./diffusion3/lib/main/iodev.o \
./diffusion3/lib/main/iohook.o \
./diffusion3/lib/main/message.o \
./diffusion3/lib/main/timers.o \
./diffusion3/lib/main/tools.o 


# Each subdirectory must supply rules for building sources it contributes
diffusion3/lib/main/%.o: ../diffusion3/lib/main/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


