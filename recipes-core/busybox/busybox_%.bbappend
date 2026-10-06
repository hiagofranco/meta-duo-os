FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://ntpd.cfg \
		   file://ntpd.init \
		   file://ntpd.default \
		   "

PACKAGES =+ "${PN}-ntpd"
FILES:${PN}-ntpd = "${sysconfdir}/init.d/ntpd ${sysconfdir}/default/ntpd"
CONFFILES:${PN}-ntpd = "${sysconfdir}/default/ntpd"

INITSCRIPT_PACKAGES += "${PN}-ntpd"
INITSCRIPT_NAME:${PN}-ntpd = "ntpd"
# networking (init-ifupdown) only on S01 runlevels 2-5
INITSCRIPT_PARAMS:${PN}-ntpd = "start 20 2 3 4 5 . stop 20 0 1 6 ."

do_install:append () {
	if grep -q "CONFIG_NTPD=y" ${B}/.config; then
		install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/default
		install -m 0755 ${UNPACKDIR}/ntpd.init \
				${D}${sysconfdir}/init.d/ntpd
		install -m 0644 ${UNPACKDIR}/ntpd.default \
				${D}${sysconfdir}/default/ntpd
	fi
}
