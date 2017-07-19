################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../dymoum/blacklist.c \
../dymoum/debug.c \
../dymoum/dymo_generic.c \
../dymoum/dymo_hello.c \
../dymoum/dymo_nb.c \
../dymoum/dymo_netlink.c \
../dymoum/dymo_re.c \
../dymoum/dymo_rerr.c \
../dymoum/dymo_socket.c \
../dymoum/dymo_timeout.c \
../dymoum/dymo_uerr.c \
../dymoum/icmp_socket.c \
../dymoum/k_route.c \
../dymoum/main.c \
../dymoum/pending_rreq.c \
../dymoum/rtable.c \
../dymoum/timer_queue.c 

OBJS += \
./dymoum/blacklist.o \
./dymoum/debug.o \
./dymoum/dymo_generic.o \
./dymoum/dymo_hello.o \
./dymoum/dymo_nb.o \
./dymoum/dymo_netlink.o \
./dymoum/dymo_re.o \
./dymoum/dymo_rerr.o \
./dymoum/dymo_socket.o \
./dymoum/dymo_timeout.o \
./dymoum/dymo_uerr.o \
./dymoum/icmp_socket.o \
./dymoum/k_route.o \
./dymoum/main.o \
./dymoum/pending_rreq.o \
./dymoum/rtable.o \
./dymoum/timer_queue.o 

C_DEPS += \
./dymoum/blacklist.d \
./dymoum/debug.d \
./dymoum/dymo_generic.d \
./dymoum/dymo_hello.d \
./dymoum/dymo_nb.d \
./dymoum/dymo_netlink.d \
./dymoum/dymo_re.d \
./dymoum/dymo_rerr.d \
./dymoum/dymo_socket.d \
./dymoum/dymo_timeout.d \
./dymoum/dymo_uerr.d \
./dymoum/icmp_socket.d \
./dymoum/k_route.d \
./dymoum/main.d \
./dymoum/pending_rreq.d \
./dymoum/rtable.d \
./dymoum/timer_queue.d 


# Each subdirectory must supply rules for building sources it contributes
dymoum/%.o: ../dymoum/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


