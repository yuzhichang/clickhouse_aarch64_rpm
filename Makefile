VERSION ?= 21.8.15.7

all : clickhouse-common-static-${VERSION}-2.aarch64.rpm
# prename is an Perl script from https://centos.pkgs.org/7/epel-x86_64/prename-1.9-5.el7.noarch.rpm.html
	prename 's/[.\d]+-\d/${VERSION}-2/' clickhouse-*.rpm

clickhouse-common-static-${VERSION}-2.aarch64.rpm : programs/clickhouse
# `rpm -i` errors with "cpio: Digest mismatch" if the rpm is > 2GB. Strip away debug info to work around.
	strip programs/clickhouse
	strip programs/clickhouse-odbc-bridge
	rm -f clickhouse-common-static*
	VERSION=${VERSION} nfpm -f nfpm.yaml pkg --packager rpm --target .
