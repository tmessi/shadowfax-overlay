# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker

DESCRIPTION="A messaging app for teams"
HOMEPAGE="https://slack.com/"
SRC_URI="
	x86? ( https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${PV}-i386.deb )
	amd64? ( https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${PV}-amd64.deb )"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/"

DEPEND="
	gnome-base/gconf:2
	x11-libs/gtk+:2
	virtual/libudev
	dev-libs/libgcrypt
	x11-libs/libnotify
	x11-libs/libXtst
	dev-libs/nss
	dev-lang/python
	x11-misc/xdg-utils
"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	cp -R "${S}/usr" "${D}/" || die "Install failed!"
}
