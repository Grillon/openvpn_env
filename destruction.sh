#!/usr/bin/env bash
for rep in srv_cle srv_vpn cli_vpn 
do (cd $rep && vagrant destroy -f) 
done
