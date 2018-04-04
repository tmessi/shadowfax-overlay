# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="CLI based audio visualizer"
HOMEPAGE="https://github.com/dpayne/cli-visualizer"
SRC_URI="https://github.com/dpayne/${PN}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+pulseaudio"

DEPEND="
	sci-libs/fftw:3.0
	sys-libs/ncurses:5
	pulseaudio? ( media-sound/pulseaudio )"
RDEPEND="${DEPEND}"
