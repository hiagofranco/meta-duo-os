FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:milkv-duo-common = " file://u-boot-fdt-support.cfg"
