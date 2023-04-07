#!/bin/bash

set -xe

ln -svf /usr/bin/python3 /usr/bin/python

make distclean

make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- rk3399pro_npu_pcie_defconfig

#make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- 
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j`nproc`

#make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- rk3399-evb.img
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- rk3399pro-evb-v11-linux.img

# generate resource.img boot.img zboot.img
./scripts/mkimg --dtb rk3399pro-evb-v11-linux.dtb

# generate kernel.img
./scripts/mkkrnlimg arch/arm64/boot/Image kernel.img

echo "All done!"

exit 0

total 232K
drwxr-xr-x  2 root root 4.0K 2月  19 10:27 .
drwxr-xr-x 12 root root  207 2月  19 10:27 ..
-rw-r--r--  1 root root  11K 2月  19 10:27 cuttlefish_defconfig
-rw-r--r--  1 root root 5.2K 2月  19 10:27 defconfig
-rw-r--r--  1 root root 5.3K 2月  19 10:27 lsk_defconfig
-rw-r--r--  1 root root  12K 2月  19 10:27 puma_defconfig
-rw-r--r--  1 root root  12K 2月  19 10:27 px30_linux_defconfig
-rw-r--r--  1 root root 8.0K 2月  19 10:27 px30_linux_robot_defconfig
-rw-r--r--  1 root root 8.6K 2月  19 10:27 ranchu64_defconfig
-rw-r--r--  1 root root  10K 2月  19 10:27 rk1806_linux_defconfig
-rw-r--r--  1 root root  12K 2月  19 10:27 rk1808_linux_defconfig
-rw-r--r--  1 root root 6.0K 2月  19 10:27 rk1808_x4_linux_defconfig
-rw-r--r--  1 root root 8.3K 2月  19 10:27 rk3308_linux_defconfig
-rw-r--r--  1 root root 6.4K 2月  19 10:27 rk3308_robot_defconfig
-rw-r--r--  1 root root  760 2月  19 10:27 rk3326_linux.config
-rw-r--r--  1 root root 7.5K 2月  19 10:27 rk3326_linux_robot_defconfig
-rw-r--r--  1 root root   32 2月  19 10:27 rk3358_linux.config
-rw-r--r--  1 root root 4.5K 2月  19 10:27 rk3399pro_npu_defconfig
-rw-r--r--  1 root root  11K 2月  19 10:27 rk3399pro_npu_pcie_defconfig
-rw-r--r--  1 root root  15K 2月  19 10:27 rockchip_cros_defconfig
-rw-r--r--  1 root root  22K 2月  19 10:27 rockchip_defconfig
-rw-r--r--  1 root root  463 2月  19 10:27 rockchip_linux_bifrost.config
-rw-r--r--  1 root root  15K 2月  19 10:27 rockchip_linux_defconfig
-rw-r--r--  1 root root 7.4K 2月  19 10:27 rockchip_linux_docker.config

