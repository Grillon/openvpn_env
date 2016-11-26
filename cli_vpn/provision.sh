#!/bin/bash
echo $PWD>pwd
apt-get update
apt-get install openvpn -y
echo "192.168.1.201 srvvpn" >> /etc/hosts
cd /etc/openvpn/
cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf .
sed -i.old -e 's/^cert client.crt/cert client1.crt/' -e 's/^key client.key/key client1.key/' -e 's/^remote my-server-1/remote srvvpn/' client.conf
cp /vagrant/keys/client1.{crt,key} /etc/openvpn
cp /vagrant/keys/ca.crt /etc/openvpn
systemctl enable openvpn@vpn.service
service openvpn start
