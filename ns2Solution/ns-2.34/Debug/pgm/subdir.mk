################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../pgm/classifier-pgm.cc \
../pgm/pgm-agent.cc \
../pgm/pgm-receiver.cc \
../pgm/pgm-sender.cc 

CC_DEPS += \
./pgm/classifier-pgm.d \
./pgm/pgm-agent.d \
./pgm/pgm-receiver.d \
./pgm/pgm-sender.d 

OBJS += \
./pgm/classifier-pgm.o \
./pgm/pgm-agent.o \
./pgm/pgm-receiver.o \
./pgm/pgm-sender.o 


# Each subdirectory must supply rules for building sources it contributes
pgm/%.o: ../pgm/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


