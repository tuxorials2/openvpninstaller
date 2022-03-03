if (-f ~/.vpn_installed)
then
	echo "BEGIN OPENVPN-FILE"
	cat .vpn.ovpn
else
	mkdir .tmp-install && cd .tmp-install
	curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
	chmod +x openvpn-install.sh
	export AUTO_INSTALL=y
	export APPROVE_INSTALL=y
	export APPROVE_IP=y
	export IPV6_SUPPORT=n
	export PORT_CHOICE=1
	export PROTOCOL_CHOICE=1
	export DNS=1
	export COMPRESSION_ENABLED=n
	export CUSTOMIZE_ENC=n
	export CLIENT=vpn
	export PASS=1
	./openvpn-install.sh > /dev/null
	echo "BEGIN OPENVPN-FILE"
	cat vpn.ovpn
	mv vpn.ovpn ~/.vpn.ovpn
	touch ~/.vpn_installed
	cd
	rm .tmp-install
fi
