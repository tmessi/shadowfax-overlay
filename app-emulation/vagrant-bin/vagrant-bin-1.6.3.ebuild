# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit unpacker

DDESCRIPTION="A tool for building and distributing virtual machines using VirtualBox"
HOMEPAGE="http://vagrantup.com/"
SRC_URI="
	x86? ( https://dl.bintray.com/mitchellh/vagrant/vagrant_${PV}_i686.deb )
	amd64? ( https://dl.bintray.com/mitchellh/vagrant/vagrant_${PV}_x86_64.deb )"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/"

RDEPEND="${RDEPEND}
	app-arch/libarchive
	net-misc/curl
	!x64-macos? ( || ( app-emulation/virtualbox app-emulation/virtualbox-bin ) )"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	cp -R "${S}/usr" "${D}/" || die "Install failed!"
	cp -R "${S}/opt" "${D}/" || die "Install failed!"
}
