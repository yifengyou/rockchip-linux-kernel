#!/bin/bash

set -xe

make distclean

ln -svf /usr/bin/python3 /usr/bin/python

make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- rockchip_linux_defconfig

#make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- 
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j`nproc`

#make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- rk3399-evb.img
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- rk3399-firefly-linux.img

# generate resource.img boot.img zboot.img
./scripts/mkimg --dtb rk3399-firefly-linux.dtb

# generate kernel.img
./scripts/mkkrnlimg arch/arm64/boot/Image kernel.img

echo "All done!"
