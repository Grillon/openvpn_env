#!/usr/bin/env bash
#certificat racine
mkdir -p cli_vpn/keys
cp srv_cle/keys/ca.crt cli_vpn/keys/ca.crt
mv srv_cle/keys/client1.{crt,key} cli_vpn/keys
