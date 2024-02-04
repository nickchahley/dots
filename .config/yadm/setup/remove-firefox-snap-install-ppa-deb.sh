#!/bin/bash
# snap version of firefox has quirks, like can't access tmp, and it is a doozey
# to get the ppa/deb/apt version installed

# "rolls back gracefully"
sudo snap disable firefox
sudo systemctl stop var-snap-firefox-common-host\\x2dhunspell.mount
sudo systemctl disable var-snap-firefox-common-host\\x2dhunspell.mount
sudo snap remove --purge firefox

# alter firefox package priority to prefer ppa/apt
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

# allow unattended firefox upgrades through apt, not snap
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

sudo add-apt-repository ppa:mozillateam/ppa
sudo apt install firefox
