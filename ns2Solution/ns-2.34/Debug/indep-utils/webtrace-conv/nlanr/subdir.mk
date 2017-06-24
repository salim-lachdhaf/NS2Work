################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../indep-utils/webtrace-conv/nlanr/logparse.cc \
../indep-utils/webtrace-conv/nlanr/tr-stat.cc 

O_SRCS += \
../indep-utils/webtrace-conv/nlanr/logparse.o \
../indep-utils/webtrace-conv/nlanr/tr-stat.o 

CC_DEPS += \
./indep-utils/webtrace-conv/nlanr/logparse.d \
./indep-utils/webtrace-conv/nlanr/tr-stat.d 

OBJS += \
./indep-utils/webtrace-conv/nlanr/logparse.o \
./indep-utils/webtrace-conv/nlanr/tr-stat.o 


# Each subdirectory must supply rules for building sources it contributes
indep-utils/webtrace-conv/nlanr/%.o: ../indep-utils/webtrace-conv/nlanr/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


