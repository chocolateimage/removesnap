#!/usr/bin/env bash
#
# Please read the README.md located at
# https://github.com/chocolateimage/removesnap/blob/main/README.md
#
#

if ! command -v snap; then
    echo "Snap is already uninstalled"
    exit 0
fi

# === Firefox ===
# Based on https://askubuntu.com/a/1404401

killall firefox

mv -f ~/snap/firefox/common/.mozilla ~/

sudo add-apt-repository --yes ppa:mozillateam/ppa

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

sudo apt install -y --allow-downgrades firefox

# Migrate Firefox profile
python3 <(wget -qO- https://raw.githubusercontent.com/chocolateimage/removesnap/refs/heads/main/migratefirefoxprofile.py)

# === Thunderbird ===
killall thunderbird

sudo snap remove thunderbird
sudo apt install -y --allow-downgrades thunderbird

# === Firmware Updater ===
sudo snap remove firmware-updater
sudo apt install -y gnome-firmware

# === Software Center ===
if snap list snap-store; then
    sudo snap remove snap-store
    sudo apt install -y gnome-software
fi

# === snapd ===
sudo apt remove --auto-remove -y snapd

# === Final touches ===
# Migrate Gnome Shell Favorite Apps
if command -v gnome-shell; then
    python3 <(wget -qO- https://raw.githubusercontent.com/chocolateimage/removesnap/refs/heads/main/migrategnomeshell.py)
fi

# Migrate LXQT Panel Quicklaunch
if command -v lxqt-panel; then
    wget -qO /tmp/migratelxqt.py https://raw.githubusercontent.com/chocolateimage/removesnap/refs/heads/main/migratelxqt.py
    sudo python3 /tmp/migratelxqt.py /etc/xdg/xdg-Lubuntu/lxqt/panel.conf
    python3 /tmp/migratelxqt.py ~/.config/lxqt/panel.conf
    python3 /tmp/migratelxqt.py
    rm -f /tmp/migratelxqt.py
fi

sudo apt remove -y lubuntu-snap-installation-monitor

rm -rf ~/snap