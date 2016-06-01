# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker

DDESCRIPTION="Development and Deployment Made Easy"
HOMEPAGE="https://www.ottoproject.io/"
SRC_URI="
	x86? ( https://releases.hashicorp.com/otto/${PV}/otto_${PV}_linux_386.zip )
	amd64? ( https://releases.hashicorp.com/otto/${PV}/otto_${PV}_linux_amd64.zip )"
LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/"

DEPEND="app-arch/unzip"
RDEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
}

src_install() {
	dobin otto
}
