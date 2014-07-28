# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="Colorized ls on steroids"
HOMEPAGE="https://github.com/trapd00r/ls--"
EGIT_REPO_URI="git://github.com/trapd00r/ls--.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-perl/Term-ExtendedColor"
RDEPEND="${DEPEND}"

src_prepare() {
	cd ${WORKDIR}/${P}
	/usr/bin/perl Makefile.PL
}

src_install() {
	emake
	emake test
	emake DESTDIR="${D}" install
}
