################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../adc/acto-adc.cc \
../adc/actp-adc.cc \
../adc/adaptive-receiver.cc \
../adc/adc.cc \
../adc/consrcvr.cc \
../adc/estimator.cc \
../adc/expavg-est.cc \
../adc/hb-adc.cc \
../adc/ms-adc.cc \
../adc/null-estimator.cc \
../adc/param-adc.cc \
../adc/pointsample-est.cc \
../adc/resv.cc \
../adc/sa.cc \
../adc/salink.cc \
../adc/simple-intserv-sched.cc \
../adc/tbf.cc \
../adc/timewindow-est.cc \
../adc/ump.cc 

CC_DEPS += \
./adc/acto-adc.d \
./adc/actp-adc.d \
./adc/adaptive-receiver.d \
./adc/adc.d \
./adc/consrcvr.d \
./adc/estimator.d \
./adc/expavg-est.d \
./adc/hb-adc.d \
./adc/ms-adc.d \
./adc/null-estimator.d \
./adc/param-adc.d \
./adc/pointsample-est.d \
./adc/resv.d \
./adc/sa.d \
./adc/salink.d \
./adc/simple-intserv-sched.d \
./adc/tbf.d \
./adc/timewindow-est.d \
./adc/ump.d 

OBJS += \
./adc/acto-adc.o \
./adc/actp-adc.o \
./adc/adaptive-receiver.o \
./adc/adc.o \
./adc/consrcvr.o \
./adc/estimator.o \
./adc/expavg-est.o \
./adc/hb-adc.o \
./adc/ms-adc.o \
./adc/null-estimator.o \
./adc/param-adc.o \
./adc/pointsample-est.o \
./adc/resv.o \
./adc/sa.o \
./adc/salink.o \
./adc/simple-intserv-sched.o \
./adc/tbf.o \
./adc/timewindow-est.o \
./adc/ump.o 


# Each subdirectory must supply rules for building sources it contributes
adc/%.o: ../adc/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


