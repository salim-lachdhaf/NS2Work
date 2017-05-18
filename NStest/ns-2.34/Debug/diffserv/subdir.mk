################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../diffserv/dewp.cc \
../diffserv/dsCore.cc \
../diffserv/dsEdge.cc \
../diffserv/dsPolicy.cc \
../diffserv/dsred.cc \
../diffserv/dsredq.cc \
../diffserv/ew.cc 

CC_DEPS += \
./diffserv/dewp.d \
./diffserv/dsCore.d \
./diffserv/dsEdge.d \
./diffserv/dsPolicy.d \
./diffserv/dsred.d \
./diffserv/dsredq.d \
./diffserv/ew.d 

OBJS += \
./diffserv/dewp.o \
./diffserv/dsCore.o \
./diffserv/dsEdge.o \
./diffserv/dsPolicy.o \
./diffserv/dsred.o \
./diffserv/dsredq.o \
./diffserv/ew.o 


# Each subdirectory must supply rules for building sources it contributes
diffserv/%.o: ../diffserv/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


