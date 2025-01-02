# removesnap
Removes snaps from a default Ubuntu installation and installs the native counterparts. (Experimental)

Currently only tested with:
- Ubuntu 24.10
- Ubuntu 24.04
- Ubuntu 22.04
- Kubuntu 24.10
- Xubuntu 24.10
- Xubuntu 24.04
- Lubuntu 24.04
- Edubuntu 24.04
- Ubuntu Budgie 24.04
- Ubuntu Cinnamon 24.04

## Usage

Copy and paste this to your terminal and press enter, make sure the system has been updated:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/chocolateimage/removesnap/refs/heads/main/removesnap.sh)
```

If you want to remove snap and have Flatpak with Flathub set up, use this command:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/chocolateimage/removesnap/refs/heads/main/installflatpak.sh)
```