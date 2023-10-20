# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot git-r3 linux-info linux-mod

DESCRIPTION="System76 kernel driver"
HOMEPAGE="https://github.com/pop-os/system76-acpi-dkms"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

EGIT_REPO_URI="https://github.com/pop-os/system76-acpi-dkms.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR=${S}

DEPEND=""
RDEPEND="${DEPEND}"


pkg_setup() {
	linux-info_pkg_setup

	MODULE_NAMES="system76_acpi(extra::)"
	BUILD_PARAMS="KERNEL_DIR=${KERNEL_DIR}"
	BUILD_TARGETS="all"
	linux-mod_pkg_setup
}

src_install() {
	linux-mod_src_install

	insinto /lib/udev/hwdb.d
	doins lib/udev/hwdb.d/*.hwdb
}
