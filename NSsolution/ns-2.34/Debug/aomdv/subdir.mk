################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../aomdv/aomdv.cc \
../aomdv/aomdv_logs.cc \
../aomdv/aomdv_rqueue.cc \
../aomdv/aomdv_rtable.cc 

CC_DEPS += \
./aomdv/aomdv.d \
./aomdv/aomdv_logs.d \
./aomdv/aomdv_rqueue.d \
./aomdv/aomdv_rtable.d 

OBJS += \
./aomdv/aomdv.o \
./aomdv/aomdv_logs.o \
./aomdv/aomdv_rqueue.o \
./aomdv/aomdv_rtable.o 


# Each subdirectory must supply rules for building sources it contributes
aomdv/%.o: ../aomdv/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


