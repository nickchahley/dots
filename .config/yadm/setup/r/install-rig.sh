#!/usr/bin/bash
# rig is a R installation manager. Use it to switch between/run multiple versions of R at the same time.
# rig add 4.4.2 # install R 4.4.2
# rig available # see available versions
#
# https://github.com/r-lib/rig?tab=readme-ov-file#id-ubuntu-and-debian-deb-package

`which sudo` curl -L https://rig.r-pkg.org/deb/rig.gpg -o /etc/apt/trusted.gpg.d/rig.gpg
`which sudo` sh -c 'echo "deb http://rig.r-pkg.org/deb rig main" > /etc/apt/sources.list.d/rig.list'

`which sudo` apt update
`which sudo` apt install r-rig
