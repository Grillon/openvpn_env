#!/usr/bin/env bash
mkdir /vagrant/keys
cp ~/placard/monca/keys/{srvvpn.crt,srvvpn.key,ca.crt,client*.crt,client*.key,dh2048.pem} /vagrant/keys
