################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../sensor-nets/agent-list.cc \
../sensor-nets/flood-agent.cc \
../sensor-nets/landmark.cc \
../sensor-nets/sensor-query.cc \
../sensor-nets/tags.cc 

CC_DEPS += \
./sensor-nets/agent-list.d \
./sensor-nets/flood-agent.d \
./sensor-nets/landmark.d \
./sensor-nets/sensor-query.d \
./sensor-nets/tags.d 

OBJS += \
./sensor-nets/agent-list.o \
./sensor-nets/flood-agent.o \
./sensor-nets/landmark.o \
./sensor-nets/sensor-query.o \
./sensor-nets/tags.o 


# Each subdirectory must supply rules for building sources it contributes
sensor-nets/%.o: ../sensor-nets/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


