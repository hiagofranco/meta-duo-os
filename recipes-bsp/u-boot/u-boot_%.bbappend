FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:milkv-duo-common = " file://u-boot-fdt-support.cfg \
				    file://env-fat.cfg \
				    file://0001-milkv_duo.env-add-fdtoverlay_addr_r.patch \
				    "

UBOOT_EXTLINUX_FDTOVERLAYS:milkv-duo = "/cv1800b-milkv-duo-eth.dtbo /cv1800b-milkv-duo-led-blink.dtbo"
