#!/usr/bin/env bash
#certificat racine
mkdir -p srv_vpn/keys
cp srv_cle/keys/ca.crt srv_vpn/keys/ca.crt
mv srv_cle/keys/srvvpn.{crt,key} srv_vpn/keys
mv srv_cle/keys/dh2048.pem srv_vpn/keys
