################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../imep/dest_queue.cc \
../imep/imep.cc \
../imep/imep_api.cc \
../imep/imep_io.cc \
../imep/imep_rt.cc \
../imep/imep_timers.cc \
../imep/imep_util.cc \
../imep/rxmit_queue.cc 

CC_DEPS += \
./imep/dest_queue.d \
./imep/imep.d \
./imep/imep_api.d \
./imep/imep_io.d \
./imep/imep_rt.d \
./imep/imep_timers.d \
./imep/imep_util.d \
./imep/rxmit_queue.d 

OBJS += \
./imep/dest_queue.o \
./imep/imep.o \
./imep/imep_api.o \
./imep/imep_io.o \
./imep/imep_rt.o \
./imep/imep_timers.o \
./imep/imep_util.o \
./imep/rxmit_queue.o 


# Each subdirectory must supply rules for building sources it contributes
imep/%.o: ../imep/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


