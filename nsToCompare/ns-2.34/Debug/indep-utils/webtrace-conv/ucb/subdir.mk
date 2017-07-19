################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../indep-utils/webtrace-conv/ucb/logparse.cc \
../indep-utils/webtrace-conv/ucb/tr-stat.cc \
../indep-utils/webtrace-conv/ucb/utils.cc 

O_SRCS += \
../indep-utils/webtrace-conv/ucb/logparse.o \
../indep-utils/webtrace-conv/ucb/tr-stat.o \
../indep-utils/webtrace-conv/ucb/utils.o 

CC_DEPS += \
./indep-utils/webtrace-conv/ucb/logparse.d \
./indep-utils/webtrace-conv/ucb/tr-stat.d \
./indep-utils/webtrace-conv/ucb/utils.d 

OBJS += \
./indep-utils/webtrace-conv/ucb/logparse.o \
./indep-utils/webtrace-conv/ucb/tr-stat.o \
./indep-utils/webtrace-conv/ucb/utils.o 


# Each subdirectory must supply rules for building sources it contributes
indep-utils/webtrace-conv/ucb/%.o: ../indep-utils/webtrace-conv/ucb/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


