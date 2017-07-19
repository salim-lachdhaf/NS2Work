################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../empweb/empftp.cc \
../empweb/empweb.cc 

CC_DEPS += \
./empweb/empftp.d \
./empweb/empweb.d 

OBJS += \
./empweb/empftp.o \
./empweb/empweb.o 


# Each subdirectory must supply rules for building sources it contributes
empweb/%.o: ../empweb/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


