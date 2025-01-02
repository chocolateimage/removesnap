#!/usr/bin/env bash
#
# Please read the README.md located at
# https://github.com/chocolateimage/removesnap/blob/main/README.md
#
#

bash <(wget -qO- https://raw.githubusercontent.com/chocolateimage/removesnap/refs/heads/main/removesnap.sh)

sudo apt install -y flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

if dpkg -s gnome-software; then
    sudo apt install -y gnome-software-plugin-flatpak
fi

if command -v kdialog; then
    if kdialog --yesno "A restart is required, do you want to restart now?" --title "Flatpak install"; then
        reboot
    fi
else
    sudo apt install -y zenity

    if zenity --question --title="Flatpak install" --text="A restart is required, do you want to restart now?" --ok-label=Yes --cancel-label=No; then
        reboot
    fi
fi