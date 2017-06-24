################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../webcache/http-aux.cc \
../webcache/http.cc \
../webcache/inval-agent.cc \
../webcache/logweb.cc \
../webcache/mcache.cc \
../webcache/pagepool.cc \
../webcache/tcp-simple.cc \
../webcache/tcpapp.cc \
../webcache/webserver.cc \
../webcache/webtraf.cc 

CC_DEPS += \
./webcache/http-aux.d \
./webcache/http.d \
./webcache/inval-agent.d \
./webcache/logweb.d \
./webcache/mcache.d \
./webcache/pagepool.d \
./webcache/tcp-simple.d \
./webcache/tcpapp.d \
./webcache/webserver.d \
./webcache/webtraf.d 

OBJS += \
./webcache/http-aux.o \
./webcache/http.o \
./webcache/inval-agent.o \
./webcache/logweb.o \
./webcache/mcache.o \
./webcache/pagepool.o \
./webcache/tcp-simple.o \
./webcache/tcpapp.o \
./webcache/webserver.o \
./webcache/webtraf.o 


# Each subdirectory must supply rules for building sources it contributes
webcache/%.o: ../webcache/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


