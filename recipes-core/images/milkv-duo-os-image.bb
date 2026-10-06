SUMMARY = "Standard full-featured Linux system for MilkV-Duo boards"

IMAGE_INSTALL = "packagegroup-core-boot \
                 packagegroup-core-full-cmdline \
                 fastfetch \
                 resize-rootfs \
                 ${CORE_IMAGE_EXTRA_INSTALL}"

IMAGE_INSTALL:append:milkv-duo = " busybox-ntpd"

IMAGE_FEATURES += "ssh-server-openssh package-management"
IMAGE_FEATURES:append:milkv-duo = " ssh-server-dropbear"
IMAGE_FEATURES:remove:milkv-duo = "ssh-server-openssh"

IMAGE_LINGUAS = " "

LICENSE = "MIT"

inherit core-image

IMAGE_ROOTFS_SIZE ?= "8192"
IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"

IMAGE_BOOT_FILES:append:milkv-duo = " cv1800b-milkv-duo-eth.dtbo"
