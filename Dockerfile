FROM ubuntu:trusty
MAINTAINER Chad McQuillen <chad@bannerstonesoftware.com>

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    automake \
    bc \
    bison \
    cmake \
    curl \
    flex \
    git \
    ncurses-dev

RUN cd /opt && git clone https://github.com/raspberrypi/tools

ENV CCPREFIX=/opt/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-

# Set to the commit hash of the kernel for which you will build against.
# See http://lostindetails.com/blog/post/Compiling-a-kernel-module-for-the-raspberry-pi-2
RUN mkdir /build \
    && cd /build \
    && git clone https://github.com/raspberrypi/linux \
    && cd linux \
    && git checkout bc1669c846b629cface0aaa367afb2b9c6226faf \
    && make ARCH=arm CROSS_COMPILE=$CCPREFIX bcmrpi_defconfig \
    && make ARCH=arm CROSS_COMPILE=$CCPREFIX
