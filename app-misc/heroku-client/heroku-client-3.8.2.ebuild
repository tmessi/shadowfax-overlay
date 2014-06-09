# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Heroku client."
HOMEPAGE="https://github.com/heroku/heroku"
SRC_URI="http://assets.heroku.com/heroku-client/heroku-client.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_install() {
	mkdir -p "${D}/opt/heroku-client"
	cp -R "${S}/" "${D}/opt/heroku-client" || die "Install failed!"
	dosym /opt/heroku-client/bin/heroku /usr/bin/heroku
}
