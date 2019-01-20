#!/usr/bin/env bash

add_repo() {
configure
set system package repository wheezy components 'main contrib non-free'
set system package repository wheezy distribution wheezy
set system package repository wheezy url http://http.us.debian.org/debian
commit ; save
}

edit_config() {
cat << EOF >> /etc/pimd.conf
phyint eth0 disable
cand_rp time 30 priority 20
cand_bootstrap_router priority 5
group_prefix 224.0.0.0 masklen 4
switch_data_threshold		rate 50000 interval 20
switch_register_threshold	rate 50000 interval 20
EOF
}

main() {
add_repo
apt-get update
apt-get install pimd
service pimd stop
edit_config
service pimd start

pimd -r
}

main "$@"