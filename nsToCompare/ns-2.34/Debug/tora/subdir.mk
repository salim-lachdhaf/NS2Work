################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tora/tora.cc \
../tora/tora_api.cc \
../tora/tora_dest.cc \
../tora/tora_io.cc \
../tora/tora_logs.cc \
../tora/tora_neighbor.cc 

CC_DEPS += \
./tora/tora.d \
./tora/tora_api.d \
./tora/tora_dest.d \
./tora/tora_io.d \
./tora/tora_logs.d \
./tora/tora_neighbor.d 

OBJS += \
./tora/tora.o \
./tora/tora_api.o \
./tora/tora_dest.o \
./tora/tora_io.o \
./tora/tora_logs.o \
./tora/tora_neighbor.o 


# Each subdirectory must supply rules for building sources it contributes
tora/%.o: ../tora/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


