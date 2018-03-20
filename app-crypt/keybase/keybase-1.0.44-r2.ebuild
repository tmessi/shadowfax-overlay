# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils systemd user versionator

MY_PV=$(replace_version_separator 3 '-')

DESCRIPTION="Client for keybase.io"
HOMEPAGE="https://keybase.io/"
SRC_URI="https://github.com/keybase/client/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+suid gui"

DEPEND="
	>=dev-lang/go-1.6:0
	gui? ( sys-apps/yarn )
	app-crypt/kbfs"
RDEPEND="
	app-crypt/gnupg"

S="${WORKDIR}/src/github.com/keybase/client"

pkg_setup() {
	enewuser keybasehelper
}

src_unpack() {
	unpack "${P}.tar.gz"
	mkdir -p "$(dirname "${S}")" || die
	mv "client-${MY_PV}" "${S}" || die
}

src_compile() {
	GOPATH="${WORKDIR}:${S}/go/vendor" \
		go build -v -x \
		-tags production \
		-o "${T}/keybase" \
		github.com/keybase/client/go/keybase || die
	GOPATH="${WORKDIR}" \
		go build -v -x \
		-tags production \
		-o "${T}/keybase-mount-helper" \
		github.com/keybase/client/go/mounter/keybase-mount-helper || die
	if use gui; then
		if use x86; then
			electron_arch=ia32
		elif use amd64; then
			electron_arch=x64
		fi
		cd "${S}/shared"
		NODE_ENV=development KEYBASE_SKIP_DEV_TOOLS=1 yarn || die
		NODE_ENV=production yarn run package --platform linux --arch "$electron_arch" --appVersion "${PV}" || die
		cd "${WORKDIR}"
	fi
}

src_install() {
	dobin "${T}/keybase"
	dodir "/var/lib/keybase"
	fowners keybasehelper:keybasehelper "/var/lib/keybase"
	dosym "/tmp/keybase" "/var/lib/keybase/mount1"
	dobin "${T}/keybase-mount-helper"
	fowners keybasehelper:keybasehelper "/usr/bin/keybase-mount-helper"
	use suid && fperms 4755 "/usr/bin/keybase-mount-helper"
	dobin "${S}/packaging/linux/run_keybase"
	systemd_douserunit "${S}/packaging/linux/systemd/keybase.service"
	dodir "/opt/keybase"
	insinto "/opt/keybase"
	doins "${S}/packaging/linux/crypto_squirrel.txt"

	if use gui; then
		if use x86; then
			electron_arch=ia32
		elif use amd64; then
			electron_arch=x64
		fi
		insinto "/opt/keybase"
		doins -r ${S}/shared/desktop/release/linux-${electron_arch}/Keybase-linux-${electron_arch}/*
	fi
}

pkg_postinst() {
	elog "Run the service: keybase service"
	elog "Run the client:  keybase login"
	elog "Restart keybase: run_keybase"
}
