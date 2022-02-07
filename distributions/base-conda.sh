# This should be sourced after base.sh!

eval "base_$(declare -f install_electrumx)"
function install_electrumx {
	base_install_electrumx
	# We installed to /opt/python, so link it to $PATH
	ln -s /opt/python/bin/electrumx* /usr/local/bin/
}

APT="apt"

function install_python39 {
	if ! declare -f install_compiler > /dev/null; then
		_error "install_compiler needs to be declared in order to use conda/install_python39" 3
	fi
	install_compiler
	$APT install python3-venv
	ln -s /opt/python/bin/python3 /usr/local/bin/python3.9
}
