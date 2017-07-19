################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../tcp/linux/src/tcp_bic.c \
../tcp/linux/src/tcp_compound.c \
../tcp/linux/src/tcp_cong.c \
../tcp/linux/src/tcp_cubic.c \
../tcp/linux/src/tcp_highspeed.c \
../tcp/linux/src/tcp_htcp.c \
../tcp/linux/src/tcp_hybla.c \
../tcp/linux/src/tcp_illinois.c \
../tcp/linux/src/tcp_lp.c \
../tcp/linux/src/tcp_scalable.c \
../tcp/linux/src/tcp_vegas.c \
../tcp/linux/src/tcp_veno.c \
../tcp/linux/src/tcp_westwood.c \
../tcp/linux/src/tcp_yeah.c 

OBJS += \
./tcp/linux/src/tcp_bic.o \
./tcp/linux/src/tcp_compound.o \
./tcp/linux/src/tcp_cong.o \
./tcp/linux/src/tcp_cubic.o \
./tcp/linux/src/tcp_highspeed.o \
./tcp/linux/src/tcp_htcp.o \
./tcp/linux/src/tcp_hybla.o \
./tcp/linux/src/tcp_illinois.o \
./tcp/linux/src/tcp_lp.o \
./tcp/linux/src/tcp_scalable.o \
./tcp/linux/src/tcp_vegas.o \
./tcp/linux/src/tcp_veno.o \
./tcp/linux/src/tcp_westwood.o \
./tcp/linux/src/tcp_yeah.o 

C_DEPS += \
./tcp/linux/src/tcp_bic.d \
./tcp/linux/src/tcp_compound.d \
./tcp/linux/src/tcp_cong.d \
./tcp/linux/src/tcp_cubic.d \
./tcp/linux/src/tcp_highspeed.d \
./tcp/linux/src/tcp_htcp.d \
./tcp/linux/src/tcp_hybla.d \
./tcp/linux/src/tcp_illinois.d \
./tcp/linux/src/tcp_lp.d \
./tcp/linux/src/tcp_scalable.d \
./tcp/linux/src/tcp_vegas.d \
./tcp/linux/src/tcp_veno.d \
./tcp/linux/src/tcp_westwood.d \
./tcp/linux/src/tcp_yeah.d 


# Each subdirectory must supply rules for building sources it contributes
tcp/linux/src/%.o: ../tcp/linux/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


