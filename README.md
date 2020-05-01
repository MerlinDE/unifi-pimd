# unifi-pimd

forked from https://github.com/bcsanford/unifi-pimd

## Overview

This script installs the latest version of [PIMD](http://troglobit.com/projects/pimd/) onto a Ubiquity Unifi USG. For that it modifies the existing list of repositories used by APT on the USG to include backported packages for the outdated Debian Weezy in use. This should at least install version 2.3 which supports IGMPv3.

## Install
login to USG

curl -sSL https://raw.githubusercontent.com/MerlinDE/unifi-pimd/master/install | bash
