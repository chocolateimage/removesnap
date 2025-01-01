#!/usr/bin/env bash
#
# Please read the README.md located at
# https://github.com/chocolateimage/removesnap/blob/main/README.md
#
#

sudo apt install -y flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

if dpkg -s gnome-software; then
    sudo apt install -y gnome-software-plugin-flatpak
fi

sudo apt install -y zenity

if zenity --question --title="Flatpak install" --text="A restart is required, do you want to restart now?" --ok-label=Yes --cancel-label=No; then
    reboot
fi