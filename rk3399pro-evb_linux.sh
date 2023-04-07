#!/bin/bash

set -xe

export PATH=`realpath ../gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin`:$PATH
echo $PATH
export ARCH=arm64
echo $ARCH
export CROSS_COMPILE=aarch64-linux-gnu-
echo $CROSS_COMPILE

ln -svf /usr/bin/python3 /usr/bin/python

make distclean

make rk3399pro_npu_pcie_defconfig

make -j`nproc`

make rk3399pro-evb-v11-linux.img

# generate resource.img boot.img zboot.img
./scripts/mkimg --dtb rk3399pro-evb-v11-linux.dtb

# generate kernel.img
./scripts/mkkrnlimg arch/arm64/boot/Image kernel.img

echo "All done!"

exit 0
