#! /bin/sh

apt-get --yes update
apt-get --yes install wget equivs curl git

deps=$(sed -e '/^#.*$/d; /^$/d; /^\s*$/d' package/dependencies | paste -sd ,)

printf >configuration "%s\n" \
	"Section: misc" \
	"Priority: optional" \
	"Homepage: https://kaytime.github.io" \
	"Package: system-core-standard" \
	"Version: 0.1.0+alpha" \
	"Maintainer: Stephane Tsana <stephanetse@gmail.com>" \
	"Depends: $deps" \
	"Architecture: all" \
	"Description: System core standard metapackage for Kaytime."

equivs-build configuration
