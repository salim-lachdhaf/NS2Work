################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../indep-utils/webtrace-conv/dec/formsquid.cc \
../indep-utils/webtrace-conv/dec/formtxt.cc \
../indep-utils/webtrace-conv/dec/my-endian.cc \
../indep-utils/webtrace-conv/dec/proxytrace.cc \
../indep-utils/webtrace-conv/dec/proxytrace2any.cc \
../indep-utils/webtrace-conv/dec/tr-stat.cc 

O_SRCS += \
../indep-utils/webtrace-conv/dec/formsquid.o \
../indep-utils/webtrace-conv/dec/formtxt.o \
../indep-utils/webtrace-conv/dec/my-endian.o \
../indep-utils/webtrace-conv/dec/proxytrace.o \
../indep-utils/webtrace-conv/dec/proxytrace2any.o \
../indep-utils/webtrace-conv/dec/tr-stat.o 

CC_DEPS += \
./indep-utils/webtrace-conv/dec/formsquid.d \
./indep-utils/webtrace-conv/dec/formtxt.d \
./indep-utils/webtrace-conv/dec/my-endian.d \
./indep-utils/webtrace-conv/dec/proxytrace.d \
./indep-utils/webtrace-conv/dec/proxytrace2any.d \
./indep-utils/webtrace-conv/dec/tr-stat.d 

OBJS += \
./indep-utils/webtrace-conv/dec/formsquid.o \
./indep-utils/webtrace-conv/dec/formtxt.o \
./indep-utils/webtrace-conv/dec/my-endian.o \
./indep-utils/webtrace-conv/dec/proxytrace.o \
./indep-utils/webtrace-conv/dec/proxytrace2any.o \
./indep-utils/webtrace-conv/dec/tr-stat.o 


# Each subdirectory must supply rules for building sources it contributes
indep-utils/webtrace-conv/dec/%.o: ../indep-utils/webtrace-conv/dec/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


