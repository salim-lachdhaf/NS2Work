################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tcp/linux/ns-linux-util.cc 

C_SRCS += \
../tcp/linux/ns-linux-c.c \
../tcp/linux/ns-linux-param.c \
../tcp/linux/tcp_naivereno.c 

CC_DEPS += \
./tcp/linux/ns-linux-util.d 

OBJS += \
./tcp/linux/ns-linux-c.o \
./tcp/linux/ns-linux-param.o \
./tcp/linux/ns-linux-util.o \
./tcp/linux/tcp_naivereno.o 

C_DEPS += \
./tcp/linux/ns-linux-c.d \
./tcp/linux/ns-linux-param.d \
./tcp/linux/tcp_naivereno.d 


# Each subdirectory must supply rules for building sources it contributes
tcp/linux/%.o: ../tcp/linux/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tcp/linux/%.o: ../tcp/linux/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


