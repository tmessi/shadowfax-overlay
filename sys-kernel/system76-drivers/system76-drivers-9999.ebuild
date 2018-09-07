# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot git-r3 linux-info linux-mod

DESCRIPTION="System76 kernel driver"
HOMEPAGE="https://github.com/pop-os/system76-dkms"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

EGIT_REPO_URI="https://github.com/pop-os/system76-dkms.git"
EGIT_BRANCH="master_bionic"
EGIT_CHECKOUT_DIR=${S}

DEPEND=""
RDEPEND="${DEPEND}"


pkg_setup() {
	MODULE_NAMES="system76(extra::)"
	BUILD_TARGETS="all"
	linux-mod_pkg_setup
}
