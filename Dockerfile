# Base image
FROM ubuntu:20.04

# Maintainer information
LABEL maintainer="Duvitech LLC <gvigelet@duvitech.com>"
LABEL description="TI CCS MSP430 build environment"

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update && \
    apt-get install -y wget make git gcc g++ libc6-dev-i386 texinfo expect libx11-dev flex bison libncurses5-dev libssl-dev libelf-dev libdw-dev libiberty-dev libtool automake autoconf libusb-1.0-0-dev libftdi-dev libftdi1 libftdi1-dev libusb-dev

# Create the target directory for CCS installation, Download and install CCS
RUN mkdir -p /opt/ti
RUN mkdir /workspace
RUN wget https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/12.8.1/CCS12.8.1.00005_web_linux-x64.tar.gz -O /tmp/CCS12.8.1.00005_web_linux-x64.tar.gz
RUN tar xzf /tmp/CCS12.8.1.00005_web_linux-x64.tar.gz -C /tmp/

# Install CCS in unattended mode
RUN /tmp/ccs_setup_12.8.1.00005.run \
    --mode unattended \
    --prefix /opt/ti \
    --accept-license \
    --enable-components PF_MSP430

# Set the workspace directory
WORKDIR /workspace
