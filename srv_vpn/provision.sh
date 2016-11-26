#!/bin/bash
echo $PWD>pwd
apt-get update
apt-get install openvpn -y
cd /etc/openvpn/
cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz .
gunzip server.conf.gz
sed -i.old -e 's/^cert server.crt/cert srvvpn.crt/' -e 's/^key server.key/key srvvpn.key/' -e 's/^dh dh1024.pem/dh dh2048.pem/' server.conf
cp /vagrant/keys/srvvpn.{crt,key} /etc/openvpn
cp /vagrant/keys/ca.crt /etc/openvpn
cp /vagrant/keys/dh2048.pem /etc/openvpn
systemctl enable openvpn@vpn.service
service openvpn start
