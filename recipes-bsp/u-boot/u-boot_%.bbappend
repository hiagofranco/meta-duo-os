FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:milkv-duo-common = " file://u-boot-fdt-support.cfg \
				    file://env-fat.cfg \
				    file://0001-milkv_duo.env-add-fdtoverlay_addr_r.patch \
				    "
