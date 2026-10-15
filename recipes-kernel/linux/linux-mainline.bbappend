FILESEXTRAPATHS:prepend := "${THISDIR}/linux:"

SRC_URI:append:milkv-duo = " file://0001-riscv-dts-sophgo-add-cv1800b-ethernet-support-overla.patch \
			     file://0001-riscv-dts-sophgo-cv18000b-add-gpio-line-names.patch \
			     file://0002-riscv-dts-sophgo-add-MilkV-Duo-LED-support-overlay.patch \
			     file://ikconfig.cfg \
			     file://blink-led.cfg \
			     "

KERNEL_DEVICETREE:append:milkv-duo = " sophgo/cv1800b-milkv-duo-eth.dtbo \
				       sophgo/cv1800b-milkv-duo-led-blink.dtbo \
				       "
