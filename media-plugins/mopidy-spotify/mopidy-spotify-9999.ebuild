# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=(python2_7)

inherit vcs-snapshot distutils-r1 git-2

DESCRIPTION="Mopidy extension for playing music from Spotify"
HOMEPAGE="http://mopidy.com https://github.com/mopidy/mopidy-spotify"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="test"

EGIT_REPO_URI="https://github.com/kingosticks/mopidy-spotify.git"
EGIT_BRANCH="fix/web_api_playlists"
EGIT_SOURCEDIR=${S}

RDEPEND=">=dev-python/pykka-1.1[${PYTHON_USEDEP}]
	>=dev-python/pyspotify-2.0.5[${PYTHON_USEDEP}]
	>=media-sound/mopidy-2.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0[${PYTHON_USEDEP}]"

DEPEND="test? ( ${RDEPEND}
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-capturelog[${PYTHON_USEDEP}]
	dev-python/responses[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( README.rst )

python_test() {
	py.test || die
}
