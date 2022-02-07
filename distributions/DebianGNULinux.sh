if [ "$VERSION_ID" !=  "10" && "$VERSION_ID" != "11" ]; then
	_warning "Only Debian Buster and Bullseye are officially supported (but this might work)"
fi

. distributions/base.sh
. distributions/base-systemd.sh
. distributions/base-debianoid.sh
. distributions/base-conda.sh
. distributions/base-compile-rocksdb.sh

APT="apt-get"

function install_leveldb {
	$APT install -y libleveldb-dev build-essential || _error "Could not install packages" 1
}
