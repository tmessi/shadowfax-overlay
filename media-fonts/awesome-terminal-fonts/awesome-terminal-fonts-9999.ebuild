# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

EGIT_REPO_URI="https://github.com/gabrielelana/awesome-terminal-fonts"
EGIT_BRANCH="master"

inherit font git-r3

DESCRIPTION="Awesome symbols in a terminal with a monospace font"
HOMEPAGE="https://github.com/gabrielelana/awesome-terminal-fonts"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

FONT_S="${S}/build"
FONT_SUFFIX="ttf"
FONT_CONF=( "${FILESDIR}/10-symbols.conf" )
