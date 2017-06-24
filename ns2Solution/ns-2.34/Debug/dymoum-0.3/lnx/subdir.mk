################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../dymoum-0.3/lnx/kdymo_destl.c \
../dymoum-0.3/lnx/kdymo_main.c \
../dymoum-0.3/lnx/kdymo_netlink.c \
../dymoum-0.3/lnx/kdymo_queue.c 

OBJS += \
./dymoum-0.3/lnx/kdymo_destl.o \
./dymoum-0.3/lnx/kdymo_main.o \
./dymoum-0.3/lnx/kdymo_netlink.o \
./dymoum-0.3/lnx/kdymo_queue.o 

C_DEPS += \
./dymoum-0.3/lnx/kdymo_destl.d \
./dymoum-0.3/lnx/kdymo_main.d \
./dymoum-0.3/lnx/kdymo_netlink.d \
./dymoum-0.3/lnx/kdymo_queue.d 


# Each subdirectory must supply rules for building sources it contributes
dymoum-0.3/lnx/%.o: ../dymoum-0.3/lnx/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


