# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5


DESCRIPTION="Colorized ls on steroids"
HOMEPAGE="https://github.com/trapd00r/ls--"

if [[ "${PV}" != "9999" ]]; then
	SRC_URI="https://github.com/trapd00r/ls--/archive/v${PV}.zip -> ls++-${PV}.zip"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/ls---${PV}"
	inherit perl-app
else
	EGIT_REPO_URI="https://github.com/trapd00r/ls--.git"
	EGIT_BRANCH="master"
	EGIT_SOURCEDIR=${S}
	KEYWORDS=""
	S=${WORKDIR}/${P}
	inherit perl-app git-2
fi

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
