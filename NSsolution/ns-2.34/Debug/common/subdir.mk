################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../common/Decapsulator.cc \
../common/Encapsulator.cc \
../common/agent.cc \
../common/bi-connector.cc \
../common/connector.cc \
../common/encap.cc \
../common/fsm.cc \
../common/ip.cc \
../common/ivs.cc \
../common/main-modular.cc \
../common/main-monolithic.cc \
../common/message.cc \
../common/messpass.cc \
../common/misc.cc \
../common/mobilenode.cc \
../common/net-interface.cc \
../common/node.cc \
../common/ns-process.cc \
../common/object.cc \
../common/packet.cc \
../common/parentnode.cc \
../common/pkt-counter.cc \
../common/ptypes2tcl.cc \
../common/scheduler-map.cc \
../common/scheduler.cc \
../common/session-rtp.cc \
../common/sessionhelper.cc \
../common/simulator.cc \
../common/splay-scheduler.cc \
../common/tclAppInit.cc \
../common/timer-handler.cc \
../common/tkAppInit.cc \
../common/tp.cc \
../common/tpm.cc \
../common/ttl.cc 

C_SRCS += \
../common/win32.c 

O_SRCS += \
../common/main-monolithic.o 

CC_DEPS += \
./common/Decapsulator.d \
./common/Encapsulator.d \
./common/agent.d \
./common/bi-connector.d \
./common/connector.d \
./common/encap.d \
./common/fsm.d \
./common/ip.d \
./common/ivs.d \
./common/main-modular.d \
./common/main-monolithic.d \
./common/message.d \
./common/messpass.d \
./common/misc.d \
./common/mobilenode.d \
./common/net-interface.d \
./common/node.d \
./common/ns-process.d \
./common/object.d \
./common/packet.d \
./common/parentnode.d \
./common/pkt-counter.d \
./common/ptypes2tcl.d \
./common/scheduler-map.d \
./common/scheduler.d \
./common/session-rtp.d \
./common/sessionhelper.d \
./common/simulator.d \
./common/splay-scheduler.d \
./common/tclAppInit.d \
./common/timer-handler.d \
./common/tkAppInit.d \
./common/tp.d \
./common/tpm.d \
./common/ttl.d 

OBJS += \
./common/Decapsulator.o \
./common/Encapsulator.o \
./common/agent.o \
./common/bi-connector.o \
./common/connector.o \
./common/encap.o \
./common/fsm.o \
./common/ip.o \
./common/ivs.o \
./common/main-modular.o \
./common/main-monolithic.o \
./common/message.o \
./common/messpass.o \
./common/misc.o \
./common/mobilenode.o \
./common/net-interface.o \
./common/node.o \
./common/ns-process.o \
./common/object.o \
./common/packet.o \
./common/parentnode.o \
./common/pkt-counter.o \
./common/ptypes2tcl.o \
./common/scheduler-map.o \
./common/scheduler.o \
./common/session-rtp.o \
./common/sessionhelper.o \
./common/simulator.o \
./common/splay-scheduler.o \
./common/tclAppInit.o \
./common/timer-handler.o \
./common/tkAppInit.o \
./common/tp.o \
./common/tpm.o \
./common/ttl.o \
./common/win32.o 

C_DEPS += \
./common/win32.d 


# Each subdirectory must supply rules for building sources it contributes
common/%.o: ../common/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

common/%.o: ../common/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


