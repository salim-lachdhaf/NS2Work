################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../indep-utils/cmu-scen-gen/setdest/calcdest.cc \
../indep-utils/cmu-scen-gen/setdest/setdest.cc \
../indep-utils/cmu-scen-gen/setdest/setdest2.cc 

O_SRCS += \
../indep-utils/cmu-scen-gen/setdest/calcdest.o \
../indep-utils/cmu-scen-gen/setdest/rng.o \
../indep-utils/cmu-scen-gen/setdest/setdest.o 

CC_DEPS += \
./indep-utils/cmu-scen-gen/setdest/calcdest.d \
./indep-utils/cmu-scen-gen/setdest/setdest.d \
./indep-utils/cmu-scen-gen/setdest/setdest2.d 

OBJS += \
./indep-utils/cmu-scen-gen/setdest/calcdest.o \
./indep-utils/cmu-scen-gen/setdest/setdest.o \
./indep-utils/cmu-scen-gen/setdest/setdest2.o 


# Each subdirectory must supply rules for building sources it contributes
indep-utils/cmu-scen-gen/setdest/%.o: ../indep-utils/cmu-scen-gen/setdest/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


