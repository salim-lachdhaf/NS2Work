################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../sctp/sctp-cmt.cc \
../sctp/sctp-hbAfterRto.cc \
../sctp/sctp-mfrHbAfterRto.cc \
../sctp/sctp-mfrTimestamp.cc \
../sctp/sctp-multipleFastRtx.cc \
../sctp/sctp-newreno.cc \
../sctp/sctp-timestamp.cc \
../sctp/sctp.cc \
../sctp/sctpDebug.cc 

CC_DEPS += \
./sctp/sctp-cmt.d \
./sctp/sctp-hbAfterRto.d \
./sctp/sctp-mfrHbAfterRto.d \
./sctp/sctp-mfrTimestamp.d \
./sctp/sctp-multipleFastRtx.d \
./sctp/sctp-newreno.d \
./sctp/sctp-timestamp.d \
./sctp/sctp.d \
./sctp/sctpDebug.d 

OBJS += \
./sctp/sctp-cmt.o \
./sctp/sctp-hbAfterRto.o \
./sctp/sctp-mfrHbAfterRto.o \
./sctp/sctp-mfrTimestamp.o \
./sctp/sctp-multipleFastRtx.o \
./sctp/sctp-newreno.o \
./sctp/sctp-timestamp.o \
./sctp/sctp.o \
./sctp/sctpDebug.o 


# Each subdirectory must supply rules for building sources it contributes
sctp/%.o: ../sctp/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


