# Contributor: Rafal Rzepecki <rafal@conjur.net>
# Maintainer:
pkgname=pgagent
pkgver=3.4.0
pkgrel=0
pkgdesc="a job scheduler for PostgreSQL"
url="http://www.pgadmin.org/docs/dev/pgagent.html"
arch="all"
license="POSTGRESQL"
depends="wxgtk2.8-base libpq"
depends_dev="wxgtk2.8-dev postgresql-dev"
makedepends="$depends_dev cmake"
install=""
subpackages="$pkgname-doc"
source="
	patched-pgAgent-3.4.0-Source.tar.gz
"

_builddir="$srcdir"/pgAgent-$pkgver-Source
prepare() {
	local i
	cd "$_builddir"
	for i in $source; do
		case $i in
		*.patch) msg $i; patch -p1 -i "$srcdir"/$i || return 1;;
		esac
	done
}

build() {
	cd "$_builddir"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DSTATIC_BUILD:BOOLEAN=FALSE
	make || return 1
}

package() {
	cd "$_builddir"

	make DESTDIR="$pkgdir" install

	# remove useless doc files
	rm "$pkgdir"/usr/README
	rm "$pkgdir"/usr/LICENSE


	install -Dm644 "$_builddir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 "$_builddir"/README "$pkgdir"/usr/share/doc/$pkgname/README
}

sha512sums="8ef4130362887145c84d51c444a891c4c7db1ffc272d4bd9a91bee97c6df9b02c5d0213e3c661b69fc44889430d8292c971f49f7b905710ac57e40673a1a4822  patched-pgAgent-3.4.0-Source.tar.gz"
