#!/bin/bash

set -xe

make distclean

ln -svf /usr/bin/python3 /usr/bin/python

make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- eaidk-610-rk3399_defconfig

#make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- 
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j`nproc`

#make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- rk3399-evb.img
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- rk3399-eaidk-610.img

# generate resource.img boot.img zboot.img
./scripts/mkimg --dtb rk3399-eaidk-610.dtb

# generate kernel.img
./scripts/mkkrnlimg arch/arm64/boot/Image kernel.img

echo "All done!"
