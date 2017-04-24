################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../mcast/classifier-lms.cc \
../mcast/ctrMcast.cc \
../mcast/lms-agent.cc \
../mcast/lms-receiver.cc \
../mcast/lms-sender.cc \
../mcast/mcast_ctrl.cc \
../mcast/rcvbuf.cc \
../mcast/replicator.cc \
../mcast/rlm.cc \
../mcast/srm-ssm.cc \
../mcast/srm-topo.cc \
../mcast/srm.cc 

CC_DEPS += \
./mcast/classifier-lms.d \
./mcast/ctrMcast.d \
./mcast/lms-agent.d \
./mcast/lms-receiver.d \
./mcast/lms-sender.d \
./mcast/mcast_ctrl.d \
./mcast/rcvbuf.d \
./mcast/replicator.d \
./mcast/rlm.d \
./mcast/srm-ssm.d \
./mcast/srm-topo.d \
./mcast/srm.d 

OBJS += \
./mcast/classifier-lms.o \
./mcast/ctrMcast.o \
./mcast/lms-agent.o \
./mcast/lms-receiver.o \
./mcast/lms-sender.o \
./mcast/mcast_ctrl.o \
./mcast/rcvbuf.o \
./mcast/replicator.o \
./mcast/rlm.o \
./mcast/srm-ssm.o \
./mcast/srm-topo.o \
./mcast/srm.o 


# Each subdirectory must supply rules for building sources it contributes
mcast/%.o: ../mcast/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


