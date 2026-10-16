FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://fw_env.config"

# u-boot config is deployed by u-boot recipe on meta-riscv, which we use to get
# the environment size.
do_install[depends] += "virtual/bootloader:do_deploy"

do_install:append() {
    env_size="$(sed -n 's/^CONFIG_ENV_SIZE=//p' ${DEPLOY_DIR_IMAGE}/u-boot.config)" 
    [ -n "$env_size" ] || bbfatal "CONFIG_ENV_SIZE not found in u-boot.config"
    sed -n -i s/@@ENV_SIZE@@/${env_size}/p ${UNPACKDIR}/fw_env.config 

    install -d ${D}${sysconfdir}
    install -m 0644 ${UNPACKDIR}/fw_env.config ${D}${sysconfdir}/
}

FILES:${PN} += "${sysconfdir}/fw_env.config"
