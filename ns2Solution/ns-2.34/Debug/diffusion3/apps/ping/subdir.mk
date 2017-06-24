################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../diffusion3/apps/ping/1pp_ping_receiver.cc \
../diffusion3/apps/ping/1pp_ping_sender.cc \
../diffusion3/apps/ping/2pp_ping_receiver.cc \
../diffusion3/apps/ping/2pp_ping_sender.cc \
../diffusion3/apps/ping/ping_common.cc \
../diffusion3/apps/ping/push_receiver.cc \
../diffusion3/apps/ping/push_sender.cc 

CC_DEPS += \
./diffusion3/apps/ping/1pp_ping_receiver.d \
./diffusion3/apps/ping/1pp_ping_sender.d \
./diffusion3/apps/ping/2pp_ping_receiver.d \
./diffusion3/apps/ping/2pp_ping_sender.d \
./diffusion3/apps/ping/ping_common.d \
./diffusion3/apps/ping/push_receiver.d \
./diffusion3/apps/ping/push_sender.d 

OBJS += \
./diffusion3/apps/ping/1pp_ping_receiver.o \
./diffusion3/apps/ping/1pp_ping_sender.o \
./diffusion3/apps/ping/2pp_ping_receiver.o \
./diffusion3/apps/ping/2pp_ping_sender.o \
./diffusion3/apps/ping/ping_common.o \
./diffusion3/apps/ping/push_receiver.o \
./diffusion3/apps/ping/push_sender.o 


# Each subdirectory must supply rules for building sources it contributes
diffusion3/apps/ping/%.o: ../diffusion3/apps/ping/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


