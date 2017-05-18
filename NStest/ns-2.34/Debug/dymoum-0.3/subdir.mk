################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../dymoum-0.3/blacklist.c \
../dymoum-0.3/debug.c \
../dymoum-0.3/dymo_generic.c \
../dymoum-0.3/dymo_hello.c \
../dymoum-0.3/dymo_nb.c \
../dymoum-0.3/dymo_netlink.c \
../dymoum-0.3/dymo_re.c \
../dymoum-0.3/dymo_rerr.c \
../dymoum-0.3/dymo_socket.c \
../dymoum-0.3/dymo_timeout.c \
../dymoum-0.3/dymo_uerr.c \
../dymoum-0.3/icmp_socket.c \
../dymoum-0.3/k_route.c \
../dymoum-0.3/main.c \
../dymoum-0.3/pending_rreq.c \
../dymoum-0.3/rtable.c \
../dymoum-0.3/timer_queue.c 

OBJS += \
./dymoum-0.3/blacklist.o \
./dymoum-0.3/debug.o \
./dymoum-0.3/dymo_generic.o \
./dymoum-0.3/dymo_hello.o \
./dymoum-0.3/dymo_nb.o \
./dymoum-0.3/dymo_netlink.o \
./dymoum-0.3/dymo_re.o \
./dymoum-0.3/dymo_rerr.o \
./dymoum-0.3/dymo_socket.o \
./dymoum-0.3/dymo_timeout.o \
./dymoum-0.3/dymo_uerr.o \
./dymoum-0.3/icmp_socket.o \
./dymoum-0.3/k_route.o \
./dymoum-0.3/main.o \
./dymoum-0.3/pending_rreq.o \
./dymoum-0.3/rtable.o \
./dymoum-0.3/timer_queue.o 

C_DEPS += \
./dymoum-0.3/blacklist.d \
./dymoum-0.3/debug.d \
./dymoum-0.3/dymo_generic.d \
./dymoum-0.3/dymo_hello.d \
./dymoum-0.3/dymo_nb.d \
./dymoum-0.3/dymo_netlink.d \
./dymoum-0.3/dymo_re.d \
./dymoum-0.3/dymo_rerr.d \
./dymoum-0.3/dymo_socket.d \
./dymoum-0.3/dymo_timeout.d \
./dymoum-0.3/dymo_uerr.d \
./dymoum-0.3/icmp_socket.d \
./dymoum-0.3/k_route.d \
./dymoum-0.3/main.d \
./dymoum-0.3/pending_rreq.d \
./dymoum-0.3/rtable.d \
./dymoum-0.3/timer_queue.d 


# Each subdirectory must supply rules for building sources it contributes
dymoum-0.3/%.o: ../dymoum-0.3/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


