FILESEXTRAPATHS_prepend := "${THISDIR}/files/tegra186:"
SRCBRANCH = "patches-${L4T_VERSION}-cti"

SRCREV = "9d80356a382354f5639bfbb688ae25cd3a0b329b"

KERNEL_REPO = "github.com/lfdmn/linux-tegra.git"
SRC_URI = "git://${KERNEL_REPO};branch=${SRCBRANCH} \
          file://tegra18_cti_defconfig \
"

KERNEL_ROOTSPEC = "root=/dev/mmcblk\${devnum}p1 rw rootwait"


do_configure_prepend(){
    mv ${WORKDIR}/tegra18_cti_defconfig ${WORKDIR}/defconfig
}
