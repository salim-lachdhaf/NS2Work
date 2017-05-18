################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../pushback/agg-spec.cc \
../pushback/ident-tree.cc \
../pushback/logging-data-struct.cc \
../pushback/pushback-queue.cc \
../pushback/pushback.cc \
../pushback/rate-estimator.cc \
../pushback/rate-limit-strategy.cc \
../pushback/rate-limit.cc 

CC_DEPS += \
./pushback/agg-spec.d \
./pushback/ident-tree.d \
./pushback/logging-data-struct.d \
./pushback/pushback-queue.d \
./pushback/pushback.d \
./pushback/rate-estimator.d \
./pushback/rate-limit-strategy.d \
./pushback/rate-limit.d 

OBJS += \
./pushback/agg-spec.o \
./pushback/ident-tree.o \
./pushback/logging-data-struct.o \
./pushback/pushback-queue.o \
./pushback/pushback.o \
./pushback/rate-estimator.o \
./pushback/rate-limit-strategy.o \
./pushback/rate-limit.o 


# Each subdirectory must supply rules for building sources it contributes
pushback/%.o: ../pushback/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


