# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=WOLDRICH
MODULE_VERSION=0.224
inherit perl-module

DESCRIPTION="Color screen output using 256 colors"
HOMEPAGE="https://github.com/trapd00r/Term-ExtendedColor"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-lang/perl-5.10"
DEPEND="${RDEPEND}"
