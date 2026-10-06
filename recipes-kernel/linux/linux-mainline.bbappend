FILESEXTRAPATHS:prepend := "${THISDIR}/linux:"

SRC_URI:append:milkv-duo = " file://0001-riscv-dts-sophgo-add-cv1800b-ethernet-support-overla.patch"
KERNEL_DEVICETREE:append:milkv-duo = " sophgo/cv1800b-milkv-duo-eth.dtbo"
