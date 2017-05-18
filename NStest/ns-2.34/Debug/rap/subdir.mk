################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../rap/media-app.cc \
../rap/rap.cc \
../rap/raplist.cc \
../rap/utilities.cc 

CC_DEPS += \
./rap/media-app.d \
./rap/rap.d \
./rap/raplist.d \
./rap/utilities.d 

OBJS += \
./rap/media-app.o \
./rap/rap.o \
./rap/raplist.o \
./rap/utilities.o 


# Each subdirectory must supply rules for building sources it contributes
rap/%.o: ../rap/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


