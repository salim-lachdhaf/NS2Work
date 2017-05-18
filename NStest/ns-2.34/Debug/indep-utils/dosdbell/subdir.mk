################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../indep-utils/dosdbell/dosdbell.c \
../indep-utils/dosdbell/dosdbellasim.c \
../indep-utils/dosdbell/dostraffic.c \
../indep-utils/dosdbell/flowlist.c \
../indep-utils/dosdbell/models.c 

OBJS += \
./indep-utils/dosdbell/dosdbell.o \
./indep-utils/dosdbell/dosdbellasim.o \
./indep-utils/dosdbell/dostraffic.o \
./indep-utils/dosdbell/flowlist.o \
./indep-utils/dosdbell/models.o 

C_DEPS += \
./indep-utils/dosdbell/dosdbell.d \
./indep-utils/dosdbell/dosdbellasim.d \
./indep-utils/dosdbell/dostraffic.d \
./indep-utils/dosdbell/flowlist.d \
./indep-utils/dosdbell/models.d 


# Each subdirectory must supply rules for building sources it contributes
indep-utils/dosdbell/%.o: ../indep-utils/dosdbell/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


