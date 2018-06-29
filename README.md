# meta-connecttech
Repository for ConnectTech BSP for Tegra carriers.

This layer depends on meta-tegra layer and meta-boot2qt for the distro. 

I tested with meta-tegra rocko-l4t-r28.2 commit 4aea5e3785dc400e31981467f475b54e652dbd67

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
