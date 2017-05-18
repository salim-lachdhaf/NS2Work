################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tools/cbr_traffic.cc \
../tools/expoo.cc \
../tools/flowmon.cc \
../tools/integrator.cc \
../tools/loss-monitor.cc \
../tools/measuremod.cc \
../tools/pareto.cc \
../tools/queue-monitor.cc \
../tools/random.cc \
../tools/ranvar.cc \
../tools/rng.cc \
../tools/trafgen.cc 

CC_DEPS += \
./tools/cbr_traffic.d \
./tools/expoo.d \
./tools/flowmon.d \
./tools/integrator.d \
./tools/loss-monitor.d \
./tools/measuremod.d \
./tools/pareto.d \
./tools/queue-monitor.d \
./tools/random.d \
./tools/ranvar.d \
./tools/rng.d \
./tools/trafgen.d 

OBJS += \
./tools/cbr_traffic.o \
./tools/expoo.o \
./tools/flowmon.o \
./tools/integrator.o \
./tools/loss-monitor.o \
./tools/measuremod.o \
./tools/pareto.o \
./tools/queue-monitor.o \
./tools/random.o \
./tools/ranvar.o \
./tools/rng.o \
./tools/trafgen.o 


# Each subdirectory must supply rules for building sources it contributes
tools/%.o: ../tools/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


