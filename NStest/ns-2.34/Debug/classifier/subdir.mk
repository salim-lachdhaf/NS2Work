################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../classifier/classifier-addr.cc \
../classifier/classifier-bst.cc \
../classifier/classifier-hash.cc \
../classifier/classifier-hier.cc \
../classifier/classifier-mac.cc \
../classifier/classifier-mcast.cc \
../classifier/classifier-mpath.cc \
../classifier/classifier-port.cc \
../classifier/classifier-qs.cc \
../classifier/classifier-virtual.cc \
../classifier/classifier.cc \
../classifier/filter.cc 

CC_DEPS += \
./classifier/classifier-addr.d \
./classifier/classifier-bst.d \
./classifier/classifier-hash.d \
./classifier/classifier-hier.d \
./classifier/classifier-mac.d \
./classifier/classifier-mcast.d \
./classifier/classifier-mpath.d \
./classifier/classifier-port.d \
./classifier/classifier-qs.d \
./classifier/classifier-virtual.d \
./classifier/classifier.d \
./classifier/filter.d 

OBJS += \
./classifier/classifier-addr.o \
./classifier/classifier-bst.o \
./classifier/classifier-hash.o \
./classifier/classifier-hier.o \
./classifier/classifier-mac.o \
./classifier/classifier-mcast.o \
./classifier/classifier-mpath.o \
./classifier/classifier-port.o \
./classifier/classifier-qs.o \
./classifier/classifier-virtual.o \
./classifier/classifier.o \
./classifier/filter.o 


# Each subdirectory must supply rules for building sources it contributes
classifier/%.o: ../classifier/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


