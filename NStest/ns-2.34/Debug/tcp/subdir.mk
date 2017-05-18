################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tcp/ack-recons.cc \
../tcp/chost.cc \
../tcp/nilist.cc \
../tcp/rq.cc \
../tcp/rtcp.cc \
../tcp/saack.cc \
../tcp/scoreboard-rh.cc \
../tcp/scoreboard-rq.cc \
../tcp/scoreboard.cc \
../tcp/scoreboard1.cc \
../tcp/snoop.cc \
../tcp/tcp-abs.cc \
../tcp/tcp-asym-fs.cc \
../tcp/tcp-asym-sink.cc \
../tcp/tcp-asym.cc \
../tcp/tcp-fack.cc \
../tcp/tcp-fs.cc \
../tcp/tcp-full.cc \
../tcp/tcp-int.cc \
../tcp/tcp-linux.cc \
../tcp/tcp-newreno.cc \
../tcp/tcp-rbp.cc \
../tcp/tcp-reno.cc \
../tcp/tcp-rfc793edu.cc \
../tcp/tcp-sack-rh.cc \
../tcp/tcp-sack1.cc \
../tcp/tcp-session.cc \
../tcp/tcp-sink.cc \
../tcp/tcp-vegas.cc \
../tcp/tcp.cc \
../tcp/tcplib-telnet.cc \
../tcp/tfrc-sink.cc \
../tcp/tfrc.cc 

CC_DEPS += \
./tcp/ack-recons.d \
./tcp/chost.d \
./tcp/nilist.d \
./tcp/rq.d \
./tcp/rtcp.d \
./tcp/saack.d \
./tcp/scoreboard-rh.d \
./tcp/scoreboard-rq.d \
./tcp/scoreboard.d \
./tcp/scoreboard1.d \
./tcp/snoop.d \
./tcp/tcp-abs.d \
./tcp/tcp-asym-fs.d \
./tcp/tcp-asym-sink.d \
./tcp/tcp-asym.d \
./tcp/tcp-fack.d \
./tcp/tcp-fs.d \
./tcp/tcp-full.d \
./tcp/tcp-int.d \
./tcp/tcp-linux.d \
./tcp/tcp-newreno.d \
./tcp/tcp-rbp.d \
./tcp/tcp-reno.d \
./tcp/tcp-rfc793edu.d \
./tcp/tcp-sack-rh.d \
./tcp/tcp-sack1.d \
./tcp/tcp-session.d \
./tcp/tcp-sink.d \
./tcp/tcp-vegas.d \
./tcp/tcp.d \
./tcp/tcplib-telnet.d \
./tcp/tfrc-sink.d \
./tcp/tfrc.d 

OBJS += \
./tcp/ack-recons.o \
./tcp/chost.o \
./tcp/nilist.o \
./tcp/rq.o \
./tcp/rtcp.o \
./tcp/saack.o \
./tcp/scoreboard-rh.o \
./tcp/scoreboard-rq.o \
./tcp/scoreboard.o \
./tcp/scoreboard1.o \
./tcp/snoop.o \
./tcp/tcp-abs.o \
./tcp/tcp-asym-fs.o \
./tcp/tcp-asym-sink.o \
./tcp/tcp-asym.o \
./tcp/tcp-fack.o \
./tcp/tcp-fs.o \
./tcp/tcp-full.o \
./tcp/tcp-int.o \
./tcp/tcp-linux.o \
./tcp/tcp-newreno.o \
./tcp/tcp-rbp.o \
./tcp/tcp-reno.o \
./tcp/tcp-rfc793edu.o \
./tcp/tcp-sack-rh.o \
./tcp/tcp-sack1.o \
./tcp/tcp-session.o \
./tcp/tcp-sink.o \
./tcp/tcp-vegas.o \
./tcp/tcp.o \
./tcp/tcplib-telnet.o \
./tcp/tfrc-sink.o \
./tcp/tfrc.o 


# Each subdirectory must supply rules for building sources it contributes
tcp/%.o: ../tcp/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


