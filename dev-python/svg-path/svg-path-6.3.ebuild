# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

MY_P=${P/-/.}
DESCRIPTION="SVG path objects and parser"
HOMEPAGE="
	https://github.com/regebro/svg.path/
	https://pypi.org/project/svg.path/
"
# no tests in sdist, as of 6.3
SRC_URI="
	https://github.com/regebro/svg.path/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64 ~x86"

BDEPEND="
	test? (
		dev-python/pillow[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# broken with new pillow version (also potentially super-fragile)
	# https://github.com/regebro/svg.path/issues/103
	tests/test_boundingbox_image.py::BoundingBoxImageTest::test_image
	tests/test_image.py::ImageTest::test_image
)
