# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	advapi32-sys@0.2.0
	ahash@0.8.11
	aho-corasick@1.1.3
	anstream@0.6.14
	anstyle-parse@0.2.4
	anstyle-query@1.0.3
	anstyle-wincon@3.0.3
	anstyle@1.0.7
	anyhow@1.0.83
	arrayvec@0.7.4
	autocfg@1.3.0
	backtrace@0.3.71
	benchmarking@0.4.13
	bindgen@0.65.1
	bitflags@1.3.2
	bitflags@2.5.0
	block-buffer@0.10.4
	block@0.1.6
	btoi@0.4.3
	built@0.7.2
	bytefmt@0.1.7
	byteorder@1.5.0
	bzip2-sys@0.1.11+1.0.8
	bzip2@0.4.4
	cc@1.0.97
	cexpr@0.6.0
	cfg-if@1.0.0
	cfg_aliases@0.1.1
	circular@0.3.0
	clang-sys@1.7.0
	clap@4.5.4
	clap_builder@4.5.2
	clap_lex@0.7.0
	colorchoice@1.0.1
	console@0.15.8
	cpufeatures@0.2.12
	crc32fast@1.4.0
	crossbeam-channel@0.5.12
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.11
	crossbeam-utils@0.8.19
	crossbeam@0.8.4
	crypto-common@0.1.6
	ctrlc@3.4.4
	dialoguer@0.11.0
	digest@0.10.7
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	displaydoc@0.2.4
	either@1.11.0
	encode_unicode@0.3.6
	encode_unicode@1.0.0
	encoding-index-japanese@1.20141219.5
	encoding-index-korean@1.20141219.5
	encoding-index-simpchinese@1.20141219.5
	encoding-index-singlebyte@1.20141219.5
	encoding-index-tradchinese@1.20141219.5
	encoding@0.2.33
	encoding_index_tests@0.1.4
	equivalent@1.0.1
	errno@0.3.9
	fallible-iterator@0.3.0
	fallible-streaming-iterator@0.1.9
	fastrand@2.1.0
	find-crate@0.6.3
	flate2@1.0.30
	fluent-langneg@0.13.0
	form_urlencoded@1.2.1
	generic-array@0.14.7
	getrandom@0.2.15
	gettext@0.4.0
	gimli@0.28.1
	git2@0.18.3
	glob@0.3.1
	hashbrown@0.14.5
	hashlink@0.9.1
	hermit-abi@0.3.9
	hostname@0.4.0
	human-panic@1.2.3
	i18n-config@0.4.6
	i18n-embed-impl@0.8.3
	i18n-embed@0.14.1
	idna@0.5.0
	indexmap@2.2.6
	indicatif@0.17.8
	instant@0.1.12
	intl-memoizer@0.5.2
	is-terminal@0.4.12
	is_terminal_polyfill@1.70.0
	itertools@0.10.5
	itertools@0.12.1
	itoa@1.0.11
	jobserver@0.1.31
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.154
	libgit2-sys@0.16.2+1.7.2
	libloading@0.8.3
	libredox@0.1.3
	librocksdb-sys@0.11.0+8.1.1
	libsqlite3-sys@0.28.0
	libz-sys@1.1.16
	linux-raw-sys@0.4.13
	locale_config@0.3.0
	lock_api@0.4.12
	log@0.4.21
	lz4-sys@1.9.4
	lz4@1.24.0
	lzma-sys@0.1.20
	malloc_buf@0.0.6
	memchr@2.7.2
	memmap@0.7.0
	minimal-lexical@0.2.1
	miniz_oxide@0.7.2
	nix@0.28.0
	nom@7.1.3
	num-traits@0.2.19
	num_cpus@1.16.0
	number_prefix@0.4.0
	objc-foundation@0.1.1
	objc@0.2.7
	objc_id@0.1.1
	object@0.32.2
	once_cell@1.19.0
	os_info@3.8.2
	parking_lot@0.12.2
	parking_lot_core@0.9.10
	peeking_take_while@0.1.2
	percent-encoding@2.3.1
	pgcopy@0.0.2
	pgn-reader@0.25.0
	pkg-config@0.3.30
	portable-atomic@1.6.0
	positioned-io@0.3.3
	ppv-lite86@0.2.17
	prettyplease@0.2.20
	prettytable-rs@0.10.0
	proc-macro2@1.0.82
	quick-csv@0.1.6
	quote@1.0.36
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_xorshift@0.3.0
	rayon-core@1.12.1
	rayon@1.10.0
	redox_syscall@0.5.1
	redox_users@0.4.5
	regex-automata@0.4.6
	regex-syntax@0.8.3
	regex@1.10.4
	rocksdb@0.21.0
	rusqlite@0.31.0
	rust-embed-impl@8.4.0
	rust-embed-utils@8.4.0
	rust-embed@8.4.0
	rustc-demangle@0.1.24
	rustc-hash@1.1.0
	rustc-serialize@0.3.25
	rustix@0.38.34
	rustversion@1.0.17
	ryu@1.0.18
	same-file@1.0.6
	scopeguard@1.2.0
	serde@1.0.202
	serde_derive@1.0.202
	serde_json@1.0.117
	serde_spanned@0.6.5
	sha2@0.10.8
	shakmaty-syzygy@0.24.0
	shakmaty@0.26.0
	shell-escape@0.1.5
	shell-words@1.1.0
	shlex@1.3.0
	smallvec@1.13.2
	strsim@0.11.1
	syn@2.0.63
	tempfile@3.10.1
	term@0.7.0
	termtree@0.4.1
	test_bin@0.4.0
	textwrap@0.16.1
	thiserror-impl@1.0.60
	thiserror@1.0.60
	tikv-jemalloc-sys@0.5.4+5.3.0-patched
	tinystr@0.7.5
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	toml@0.5.11
	toml@0.8.12
	toml_datetime@0.6.5
	toml_edit@0.22.12
	tr@0.1.7
	type-map@0.5.0
	typenum@1.17.0
	unic-langid-impl@0.9.5
	unic-langid@0.9.5
	unicase@2.7.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-width@0.1.12
	url@2.5.0
	username@0.2.0
	utf8parse@0.2.1
	uuid@1.8.0
	vcpkg@0.2.15
	version_check@0.9.4
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	winapi-build@0.1.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.8
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.2.8
	winapi@0.3.9
	windows-core@0.52.0
	windows-sys@0.52.0
	windows-targets@0.52.5
	windows@0.52.0
	windows_aarch64_gnullvm@0.52.5
	windows_aarch64_msvc@0.52.5
	windows_i686_gnu@0.52.5
	windows_i686_gnullvm@0.52.5
	windows_i686_msvc@0.52.5
	windows_x86_64_gnu@0.52.5
	windows_x86_64_gnullvm@0.52.5
	windows_x86_64_msvc@0.52.5
	winnow@0.6.8
	xz2@0.1.7
	zerocopy-derive@0.7.34
	zerocopy@0.7.34
	zstd-safe@7.1.0
	zstd-sys@2.0.10+zstd.1.5.6
	zstd@0.13.1
"

LLVM_COMPAT=( {16..20} )

inherit cargo llvm-r1

DESCRIPTION="swiss army knife for chess file formats"
HOMEPAGE="https://git.sr.ht/~alip/jja"

if [[ "${PV}" == "9999" ]] ; then
	EGIT_REPO_URI="https://git.sr.ht/~alip/${PN}"
	inherit git-r3
	S="${WORKDIR}/${P}"
else
	SRC_URI="https://git.sr.ht/~alip/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
	"

	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-v${PV}"
fi

# rocksdb needs clang
DEPEND+="$(llvm_gen_dep '
	llvm-core/clang:${LLVM_SLOT}
	llvm-core/llvm:${LLVM_SLOT}
	')
	sys-libs/liburing"
RDEPEND=${DEPEND}
LICENSE="GPL-3+"

# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD CC0-1.0 GPL-3+ ISC MIT Unicode-DFS-2016"
SLOT="0"

pkg_setup() {
	llvm-r1_pkg_setup
	rust_pkg_setup
}

src_unpack() {

	if [[ "${PV}" == "9999" ]] ; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi

}

src_prepare() {
	pushd .
	cd "${WORKDIR}/cargo_home/gentoo/librocksdb-sys-0.11.0+8.1.1/rocksdb"
	pwd
	eapply "${FILESDIR}/rocksdb-10.1-fixincludes.patch"
	popd
	eapply_user
}
