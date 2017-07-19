################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../dymoum/lnx/kdymo_destl.c \
../dymoum/lnx/kdymo_main.c \
../dymoum/lnx/kdymo_netlink.c \
../dymoum/lnx/kdymo_queue.c 

OBJS += \
./dymoum/lnx/kdymo_destl.o \
./dymoum/lnx/kdymo_main.o \
./dymoum/lnx/kdymo_netlink.o \
./dymoum/lnx/kdymo_queue.o 

C_DEPS += \
./dymoum/lnx/kdymo_destl.d \
./dymoum/lnx/kdymo_main.d \
./dymoum/lnx/kdymo_netlink.d \
./dymoum/lnx/kdymo_queue.d 


# Each subdirectory must supply rules for building sources it contributes
dymoum/lnx/%.o: ../dymoum/lnx/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


