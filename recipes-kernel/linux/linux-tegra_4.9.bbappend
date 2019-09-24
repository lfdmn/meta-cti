FILESEXTRAPATHS_prepend := "${THISDIR}/files/tegra186:"
SRCBRANCH = "patches-${L4T_VERSION}-cti-v126"

SRCREV = "92f5594641f58e1f7ff9e1813dc0fd6803b25149"

KERNEL_REPO = "git@github.com:lfdmn/linux-tegra-4.9.git"
SRC_URI = "git://${KERNEL_REPO};protocol=ssh;branch=${SRCBRANCH} \
          file://tegra186_cti_defconfig \
"

KERNEL_ROOTSPEC = "root=/dev/mmcblk${@uboot_var('devnum')}p${@uboot_var('distro_bootpart') rw rootwait

do_configure_prepend(){
    mv ${WORKDIR}/tegra186_cti_defconfig ${WORKDIR}/defconfig
}
