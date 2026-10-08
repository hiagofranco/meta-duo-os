SUMMARY = "Pin Multiplexing for Milk-V Duo, Duo256M, DuoS"
HOMEPAGE = "https://github.com/milkv-duo/duo-pinmux"

LICENSE = "LicenseRef-Proprietary"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Proprietary;md5=0557f9d92cf58f2ccdd50f62f8ac0b28"

SRC_URI = "git://github.com/milkv-duo/duo-pinmux;protocol=https;branch=main \
           file://0001-duo-duo256m-duos-Makefile-use-OE-toolchain-and-flags.patch \
           "
SRCREV = "49a1d4ae2ccc18286e8c6dd60490189e8b85a9b8"

B:milkv-duo = "${S}/duo"
B:milkv-duo256m = "${S}/duo256m"
B:milkv-duos = "${S}/duos"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${B}/duo-pinmux ${D}${bindir}/duo-pinmux
}

COMPATIBLE_MACHINE = "milkv-duo-common"
PACKAGE_ARCH = "${MACHINE_ARCH}"
