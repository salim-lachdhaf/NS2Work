################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../queue/cbq.cc \
../queue/delayer.cc \
../queue/delaymodel.cc \
../queue/demarker.cc \
../queue/drop-tail.cc \
../queue/drr.cc \
../queue/dsr-priqueue.cc \
../queue/errmodel.cc \
../queue/fec.cc \
../queue/fq.cc \
../queue/gk.cc \
../queue/jobs.cc \
../queue/marker.cc \
../queue/pi.cc \
../queue/priqueue.cc \
../queue/queue.cc \
../queue/red-pd.cc \
../queue/red.cc \
../queue/rem.cc \
../queue/rio.cc \
../queue/rtqueue.cc \
../queue/semantic-packetqueue.cc \
../queue/semantic-red.cc \
../queue/semantic-rio.cc \
../queue/sfq.cc \
../queue/srr.cc \
../queue/vq.cc 

CC_DEPS += \
./queue/cbq.d \
./queue/delayer.d \
./queue/delaymodel.d \
./queue/demarker.d \
./queue/drop-tail.d \
./queue/drr.d \
./queue/dsr-priqueue.d \
./queue/errmodel.d \
./queue/fec.d \
./queue/fq.d \
./queue/gk.d \
./queue/jobs.d \
./queue/marker.d \
./queue/pi.d \
./queue/priqueue.d \
./queue/queue.d \
./queue/red-pd.d \
./queue/red.d \
./queue/rem.d \
./queue/rio.d \
./queue/rtqueue.d \
./queue/semantic-packetqueue.d \
./queue/semantic-red.d \
./queue/semantic-rio.d \
./queue/sfq.d \
./queue/srr.d \
./queue/vq.d 

OBJS += \
./queue/cbq.o \
./queue/delayer.o \
./queue/delaymodel.o \
./queue/demarker.o \
./queue/drop-tail.o \
./queue/drr.o \
./queue/dsr-priqueue.o \
./queue/errmodel.o \
./queue/fec.o \
./queue/fq.o \
./queue/gk.o \
./queue/jobs.o \
./queue/marker.o \
./queue/pi.o \
./queue/priqueue.o \
./queue/queue.o \
./queue/red-pd.o \
./queue/red.o \
./queue/rem.o \
./queue/rio.o \
./queue/rtqueue.o \
./queue/semantic-packetqueue.o \
./queue/semantic-red.o \
./queue/semantic-rio.o \
./queue/sfq.o \
./queue/srr.o \
./queue/vq.o 


# Each subdirectory must supply rules for building sources it contributes
queue/%.o: ../queue/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


