# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker

DESCRIPTION="Team chat that's actually built for business"
HOMEPAGE="https://www.hipchat.com/"
SRC_URI="https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client/pool/HipChat4-${PV}-Linux.deb"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/"

DEPEND="
	sys-apps/dbus
	sys-libs/glibc
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/freetype
	media-libs/mesa
	dev-libs/expat
	dev-libs/nspr
	x11-libs/libICE
	x11-libs/libX11
	x11-libs/libxcb[xkb]
	x11-libs/libXau
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libXrender
	dev-libs/libxslt
	x11-libs/libXtst
"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	cp -R "${S}/usr" "${D}/" || die "Install failed!"
	cp -R "${S}/opt" "${D}/" || die "Install failed!"
	dosym "${D}/opt/HipChat4/bin/HipChat4" "${D}/usr/bin/hipchat"
}
