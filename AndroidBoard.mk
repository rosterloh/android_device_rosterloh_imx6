LOCAL_PATH := $(call my-dir)

RAMDISK_TARGET := $(PRODUCT_OUT)/boot/uramdisk.img
$(RAMDISK_TARGET): $(PRODUCT_OUT)/ramdisk.img kernelmodules
	mkdir -p $(dir $@)
	mkimage -A arm -O linux -T ramdisk -n "RAM Disk" -d $< $@

bootimage: $(RAMDISK_TARGET)

BOARD_SEPOLICY_DIRS := device/rosterloh/imx6/sepolicy