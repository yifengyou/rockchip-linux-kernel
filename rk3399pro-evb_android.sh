#!/bin/bash

set -xe

export PATH=`realpath ../gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin`:$PATH
echo $PATH
export ARCH=arm64
echo $ARCH
export CROSS_COMPILE=aarch64-linux-gnu-
echo $CROSS_COMPILE

#ln -svf /usr/bin/python3 /usr/bin/python

make distclean

make rk3399pro_npu_pcie_defconfig | tee log.rk3399pro-evb-v11-android

make -j`nproc` | tee -a log.rk3399pro-evb-v11-android

make rk3399pro-evb-v11.img | tee -a log.rk3399pro-evb-v11-android

# generate resource.img boot.img zboot.img
./scripts/mkimg --dtb rk3399pro-evb-v11.dtb | tee -a log.rk3399pro-evb-v11-android

# generate kernel.img
./scripts/mkkrnlimg arch/arm64/boot/Image kernel.img | tee -a log.rk3399pro-evb-v11-android

echo "All done!"

exit 0
