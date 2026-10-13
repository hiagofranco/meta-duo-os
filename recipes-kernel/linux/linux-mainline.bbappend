FILESEXTRAPATHS:prepend := "${THISDIR}/linux:"

SRC_URI:append:milkv-duo = " file://0001-riscv-dts-sophgo-add-cv1800b-ethernet-support-overla.patch \
                             file://0002-cv1800b-milkv-duo-enable-LEDS-and-gpio-line-names.patch \
                             file://ikconfig.cfg \
                             file://leds.cfg \
                             file://not-used.cfg \
                             "

KERNEL_DEVICETREE:append:milkv-duo = " sophgo/cv1800b-milkv-duo-eth.dtbo"
