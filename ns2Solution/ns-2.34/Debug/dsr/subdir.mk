################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../dsr/add_sr.cc \
../dsr/dsr_proto.cc \
../dsr/dsragent.cc \
../dsr/flowstruct.cc \
../dsr/hdr_sr.cc \
../dsr/linkcache.cc \
../dsr/mobicache.cc \
../dsr/path.cc \
../dsr/requesttable.cc \
../dsr/routecache.cc \
../dsr/simplecache.cc \
../dsr/sr_forwarder.cc 

CC_DEPS += \
./dsr/add_sr.d \
./dsr/dsr_proto.d \
./dsr/dsragent.d \
./dsr/flowstruct.d \
./dsr/hdr_sr.d \
./dsr/linkcache.d \
./dsr/mobicache.d \
./dsr/path.d \
./dsr/requesttable.d \
./dsr/routecache.d \
./dsr/simplecache.d \
./dsr/sr_forwarder.d 

OBJS += \
./dsr/add_sr.o \
./dsr/dsr_proto.o \
./dsr/dsragent.o \
./dsr/flowstruct.o \
./dsr/hdr_sr.o \
./dsr/linkcache.o \
./dsr/mobicache.o \
./dsr/path.o \
./dsr/requesttable.o \
./dsr/routecache.o \
./dsr/simplecache.o \
./dsr/sr_forwarder.o 


# Each subdirectory must supply rules for building sources it contributes
dsr/%.o: ../dsr/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


