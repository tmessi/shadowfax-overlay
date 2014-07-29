# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 perl-app

DESCRIPTION="Colorized ls on steroids"
HOMEPAGE="https://github.com/trapd00r/ls--"
SRC_URI="https://github.com/trapd00r/ls--/archive/v${PV}.zip -> ls++-${PV}.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
S="${WORKDIR}/ls---${PV}"

DEPEND="dev-perl/Term-ExtendedColor"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install
	dodoc "ls++.conf"
}
