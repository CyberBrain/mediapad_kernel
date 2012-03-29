export KBUILD_BUILD_USER="Mediapad EX"
export ARCH=arm
export SUBARCH=arm
#export CROSS_COMPILE=arm-linux-androideabi-

export CROSS_COMPILE="/home/ubu/toolchain/arm-linux/bin/arm-linux-androideabi-"

ROOTFS_PATH="/home/ubu/ramdisk"
ramdisk_dir=/home/ubu/ramdisk/ramdisk.gz
CMDLINE="console=console=ttyHSL0,115200,n8 androidboot.hardware=hws7300u vmalloc=578M"
BASE="0x40300000"

make -j4

cp arch/arm/boot/zImage .

find -name '*.ko' -exec cp -av {} lib/modules/ \;

# Make boot.img

./mkbootimg --cmdline "$CMDLINE" --base $BASE --kernel zImage --ramdisk $ramdisk_dir -o boot_new.img

