#!/usr/bin/env bash
cd srv_cle
vagrant up
cd ..
./transfert_cli_keys.sh
./transfert_srv_keys.sh
cd srv_vpn
vagrant up
cd ..
cd cli_vpn
vagrant up
echo "fin des opérations"
