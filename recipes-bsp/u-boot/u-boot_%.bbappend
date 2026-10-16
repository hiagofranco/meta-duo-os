FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:milkv-duo-common = " file://u-boot-fdt-support.cfg \
				    file://env-fat.cfg \
				    file://preboot.cfg \
				    file://0001-milkv_duo.env-milkv_duo_256m.env-add-fdtoverlay_addr.patch \
				    "

SRC_URI:append:milkv-duo256m = " file://0002-board-sophgo-milkv_duo_256m-fix-fdtfile-quoting.patch"

UBOOT_EXTLINUX_FDTOVERLAYS:milkv-duo = "/cv1800b-milkv-duo-eth.dtbo /cv1800b-milkv-duo-led-blink.dtbo"
UBOOT_EXTLINUX_FDTOVERLAYS:milkv-duo256m = "/sg2002-milkv-duo256m-eth.dtbo"
