# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build systemd

DESCRIPTION="Client for keybase.io"
HOMEPAGE="https://keybase.io/"
SRC_URI="https://github.com/keybase/client/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gui"

DEPEND="
	>=dev-lang/go-1.6:0
	gui? ( sys-apps/yarn )
	~app-crypt/kbfs-${PV}"
RDEPEND="
	app-crypt/gnupg"

QA_PRESTRIPPED="
	/opt/keybase/Keybase                                                                                                             │
	/opt/keybase/libnode.so                                                                                                              │
	/opt/keybase/libffmpeg.so"


src_unpack() {
	unpack "${P}.tar.gz"
	ln -vs "client-${PV}" "${P}" || die
	mkdir -vp "${S}/src/github.com/keybase" || die
	ln -vs "${S}" "${S}/src/github.com/keybase/client" || die
}

src_compile() {
	EGO_PN="github.com/keybase/client/go/keybase" \
		EGO_BUILD_FLAGS="-tags production -o ${T}/keybase" \
		golang-build_src_compile

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

src_test() {
	EGO_PN="github.com/keybase/client/go/keybase" \
		golang-build_src_test
}

src_install() {
	dobin "${T}/keybase"
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
		doins ${S}/shared/desktop/release/linux-${electron_arch}/Keybase-linux-${electron_arch}/*.pak
		doins ${S}/shared/desktop/release/linux-${electron_arch}/Keybase-linux-${electron_arch}/*.dat
		doins ${S}/shared/desktop/release/linux-${electron_arch}/Keybase-linux-${electron_arch}/*.bin
		doins ${S}/shared/desktop/release/linux-${electron_arch}/Keybase-linux-${electron_arch}/*.html
		doins ${S}/shared/desktop/release/linux-${electron_arch}/Keybase-linux-${electron_arch}/*.so
		doins ${S}/shared/desktop/release/linux-${electron_arch}/Keybase-linux-${electron_arch}/LICENSE
		doins ${S}/shared/desktop/release/linux-${electron_arch}/Keybase-linux-${electron_arch}/version
		doins -r ${S}/shared/desktop/release/linux-${electron_arch}/Keybase-linux-${electron_arch}/locales
		doins -r ${S}/shared/desktop/release/linux-${electron_arch}/Keybase-linux-${electron_arch}/resources
		exeinto "/opt/keybase"
		doexe ${S}/shared/desktop/release/linux-${electron_arch}/Keybase-linux-${electron_arch}/Keybase

		for size in 16 32 128 256 512 ; do
		  icon_dest="/usr/share/icons/hicolor/${size}x${size}/apps"
		  dodir "$icon_dest"
		  cp "${S}/media/icons/Keybase.iconset/icon_${size}x${size}.png" "${D}/$icon_dest/keybase.png"
		done
	fi
}

pkg_postinst() {
	elog "Start/Restart keybase: run_keybase"
	elog "Run the service:       keybase service"
	elog "Run the client:        keybase login"
	ewarn "Note that the user keybasehelper is obsolete and can be removed"
}
