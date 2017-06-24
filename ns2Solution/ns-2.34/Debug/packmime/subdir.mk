################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../packmime/packmime_HTTP.cc \
../packmime/packmime_HTTP_rng.cc \
../packmime/packmime_OL.cc \
../packmime/packmime_OL_ranvar.cc \
../packmime/packmime_ranvar.cc 

CC_DEPS += \
./packmime/packmime_HTTP.d \
./packmime/packmime_HTTP_rng.d \
./packmime/packmime_OL.d \
./packmime/packmime_OL_ranvar.d \
./packmime/packmime_ranvar.d 

OBJS += \
./packmime/packmime_HTTP.o \
./packmime/packmime_HTTP_rng.o \
./packmime/packmime_OL.o \
./packmime/packmime_OL_ranvar.o \
./packmime/packmime_ranvar.o 


# Each subdirectory must supply rules for building sources it contributes
packmime/%.o: ../packmime/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


