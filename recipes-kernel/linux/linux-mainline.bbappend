FILESEXTRAPATHS:prepend := "${THISDIR}/linux:"

SRC_URI:append:milkv-duo-common = " file://0001-soc-sophgo-cv1800-rtcsys-use-shutdown-request-for-po.patch \
				    file://0001-riscv-dts-sophgo-add-ethernet0-for-milkv-duo-and-duo.patch \
				    file://0002-riscv-dts-sophgo-cv180x-Fix-internal-ephy-node-name.patch \
				    file://ikconfig.cfg \
				    file://blink-led.cfg \
				    "

SRC_URI:append:milkv-duo = " file://0001-riscv-dts-sophgo-add-cv1800b-ethernet-support-overla.patch \
			     file://0001-riscv-dts-sophgo-cv18000b-add-gpio-line-names.patch \
			     file://0002-riscv-dts-sophgo-add-MilkV-Duo-LED-support-overlay.patch \
			     "

SRC_URI:append:milkv-duo256m = " file://0001-riscv-dts-sophgo-add-Milk-V-Duo-256M-ethernet-suppor.patch"

KERNEL_DEVICETREE:append:milkv-duo = " sophgo/cv1800b-milkv-duo-eth.dtbo \
				       sophgo/cv1800b-milkv-duo-led-blink.dtbo \
				       "

KERNEL_DEVICETREE:append:milkv-duo256m = " sophgo/sg2002-milkv-duo256m-eth.dtbo"
