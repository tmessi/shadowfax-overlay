# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit perl-app git-2

DESCRIPTION="Colorized ls on steroids"
HOMEPAGE="https://github.com/trapd00r/ls--"

EGIT_REPO_URI="https://github.com/trapd00r/ls--.git"
EGIT_BRANCH="master"
EGIT_SOURCEDIR=${S}
KEYWORDS=""
S="${WORKDIR}/${P}"

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
