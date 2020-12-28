# Maintainer: nibbler <nibbler@nibbler.dev>

pkgname=athens
pkgver=0.10.0
pkgrel=1
epoch=

url='https://docs.gomods.io'
pkgdesc="proxy server for the Go Modules download API run by systemd"
license=('MIT')

arch=('x86_64')

depends=('glibc' 'go')
makedepends=('git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gomods/athens/archive/v${pkgver}.tar.gz"
				'athens.service'
				'athens.conf'
				'config.toml'
				'download-mode.hcl'
				'download-mode.hcl.proto'
				'.gitconfig')
sha512sums=('f105959eeb07ecb16c50956dc12f47813117814e3ce097394618d2f4b83f04bbb71cb3884639984960566d46170e111631623b7282810eaddebbac86625760f1'
            '623b53c297867ac708183070effb8014bb409b65f136bd91075b2cccd18bbfb95eb197b108e023b585125326d1a39879d877c98e78622c828872094fb6ff6fe4'
            '8b0a1c847e36fd7bfce627c4446ba12495fa32ca5a308904bbbd4ce28826be7e065b7b32ad6f44155441366edf8cec6d1b189f65de486197a791dc4a818f1ec1'
            '535620641158ead46207d2c873f36f47932eed524db0e28868aed28450d0f6da25b695cbe7a11a09775db164b303625dc06a530d4638a5c335fe0dd76d1152bd'
            '3eeedb58ca246d54d36292c900cfefb0a14773a14f902a49c685794b05d882f54e3ae079e63eea364c4acf894e20aa9e4c6cac663a7a5456706e014e7506bd64'
            'e9469e223020df0ab143d0c2b15370c6f591e98c93200d16b23a60deb6766b11fa7a6772d31516e347d0aa2d10db152343408852844c1a087d4161f1dc759f38'
            'e8b5263a4e531e6dff32dd5abfea059cfdf9cb507bfc3698a7793099269b0bd6b60ba228974910b1f1198196baa1181025c69530195c635cfb4a602207c47d0f')
backup=('etc/athens/config.toml'
				'etc/athens/download-mode.hcl'
				'var/lib/athens/.gitconfig')
install='.install'

build() {
		local DATE="$(date -u +%Y-%m-%d-%H:%M:%S-%Z)"

		cd "${pkgname}-${pkgver}"
		GO111MODULE=on CGO_ENABLED=0 GOPROXY="https://proxy.golang.org" go build \
							 -ldflags "-X github.com/gomods/athens/pkg/build.version=${pkgver} -X github.com/gomods/athens/pkg/build.buildDate=${DATE} -w -s" \
							 -trimpath -o athens ./cmd/proxy
}

package() {
		# install athens binary
		install -Dm755 "${srcdir}/${pkgname}-${pkgver}/athens" "${pkgdir}/usr/bin/athens"

		# install athens systemd service and sysusers configurations to create corresponding user and group
		install -Dm644 "${srcdir}/athens.conf" "${pkgdir}/usr/lib/sysusers.d/athens.conf"
		install -Dm644 "${srcdir}/athens.service" "$pkgdir/usr/lib/systemd/system/athens.service"

		# install athens documentation and license
		install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/athens/LICENSE"
		install -Dm644 "${srcdir}/${pkgname}-${pkgver}/config.dev.toml" "${pkgdir}/usr/share/doc/athens/examples/config.dev.toml"
		install -Dm644 "${srcdir}/download-mode.hcl.proto" "${pkgdir}/usr/share/doc/athens/examples/download-mode.hcl.proto"
		install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/athens/README.md"

		# install athens configuration files
		install -Dm600 "${srcdir}/config.toml" "${pkgdir}/etc/athens/config.toml"
		install -Dm600 "${srcdir}/download-mode.hcl" "${pkgdir}/etc/athens/download-mode.hcl"

		# install .gitconfig
		install -Ddm700 "${pkgdir}/var/lib/athens/"
		install -Dm600 "${srcdir}/.gitconfig" "${pkgdir}/var/lib/athens/.gitconfig"
}
