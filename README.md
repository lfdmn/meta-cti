# meta-connecttech
## Overview
Repository for ConnectTech carriers BSP for Tegra.

This layer depends on [meta-tegra](https://github.com/madisongh/meta-tegra) layer and meta-boot2qt for the distro. 

I tested with meta-tegra warrior-l4t-r32.2 commit ee72f83395d70349c90ed5271246b7478482f19a with Astro carrier. 

## Adding other machines for other carrier boards
I recommand you to install NVIdia's jetpack, 4.2 for warrior-l4t-r32.2, and install ConnectTech BSP on top of it.

Flash your device with Jetpack ubuntu distro and check the HW works well, then you are sure you have selected the correct configuration.

Create a new machine in conf/machine and take an existing one as template. In that file update the following keys:
* KERNEL_DEVICETREE
* ODMDATA
* UBOOT_MACHINE

Example:
astro-revG+.conf has
* DTB_FILE=tegra186-tx2-cti-ASG001-revG+.dtb
* ODMDATA=0x6090000
* SYSBOOTFILE=p2771-0000/extlinux.conf;

So the machine file looks like
* KERNEL_DEVICETREE ?= "_ddot_/_ddot_/_ddot_/_ddot_/nvidia/platform/t18x/quill/kernel-dts/tegra186-tx2-cti-ASG001-revG+.dtb"
* ODMDATA ?= "0x6090000"
* UBOOT_MACHINE = "**p2771-0000**-500_defconfig"

Finally the distro requires conf file matching the machine name. In conf/distro/include. Take an existing one and rename it. ex: astro-tx2.conf


## Qt specifics
The distro is based on meta-boot2qt. On the meta-boot2qt directory create 2 symlinks per machine as:
```bash
cd ./meta-boot2qt/recipes-qt/boot2qt-addons/boot2qt-appcontroller
ln -n jetson-tx2 astro-tx2 
cd ./meta-boot2qt-distro/recipes-qt/qt5/qtbase
ln -s jetson-tx2 astro-tx2
```

```bash
cd ./meta-boot2qt/recipes-qt/boot2qt-addons/boot2qt-appcontroller
ln -s jetson-tx2 elroy-tx2
cd ./meta-boot2qt-distro/recipes-qt/qt5/qtbase
ln -s jetson-tx2 elroy-tx2
```
If you use repotool, you can declare the symlinks with **linkfile** tags without push the changes upstream.
