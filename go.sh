#!/bin/bash

set -xe

ln -svf /usr/bin/python3 /usr/bin/python

make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- rockchip_linux_defconfig

#make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- 
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j`nproc`

#make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- rk3399-evb.img
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- rk3399-firefly-linux.img

echo "All done!"
