################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../nix/classifier-nix.cc \
../nix/hdr_nv.cc \
../nix/nixnode.cc \
../nix/nixroute.cc \
../nix/nixvec.cc 

CC_DEPS += \
./nix/classifier-nix.d \
./nix/hdr_nv.d \
./nix/nixnode.d \
./nix/nixroute.d \
./nix/nixvec.d 

OBJS += \
./nix/classifier-nix.o \
./nix/hdr_nv.o \
./nix/nixnode.o \
./nix/nixroute.o \
./nix/nixvec.o 


# Each subdirectory must supply rules for building sources it contributes
nix/%.o: ../nix/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


