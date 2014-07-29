# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5


DESCRIPTION="Colorized ls on steroids"
HOMEPAGE="https://github.com/trapd00r/ls--"

SRC_URI="https://github.com/trapd00r/ls--/archive/v${PV}.zip -> ls++-${PV}.zip"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/ls---${PV}"
inherit perl-app

LICENSE=""
SLOT="0"
IUSE=""

DEPEND="dev-perl/Term-ExtendedColor"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install
	insinto /etc
	doins ls++.conf
	dodoc ls++.conf
}
