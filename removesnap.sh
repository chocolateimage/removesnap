#!/usr/bin/env bash


# === Firefox ===
# Based on https://askubuntu.com/a/1404401

killall firefox

mv -f ~/snap/firefox/common/.mozilla ~/

sudo add-apt-repository ppa:mozillateam/ppa

echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001

Package: firefox
Pin: version 1:1snap*
Pin-Priority: -1
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

sudo snap remove firefox

sudo rm /etc/apparmor.d/usr.bin.firefox
sudo rm /etc/apparmor.d/local/usr.bin.firefox

sudo systemctl stop var-snap-firefox-common-host\\x2dhunspell.mount
sudo systemctl disable var-snap-firefox-common-host\\x2dhunspell.mount
sudo snap remove firefox

sudo apt install firefox