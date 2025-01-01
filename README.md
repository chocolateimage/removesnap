# removesnap
Removes snaps from a default Ubuntu installation and installs the native counterparts. (Experimental)

Currently only tested with:
- Kubuntu 24.10

## Usage

Copy and paste this to your terminal and press enter, make sure the system has been updated:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/chocolateimage/removesnap/refs/heads/main/removesnap.sh)
```

If you also want to have Flatpak with Flathub set up, use this command:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/chocolateimage/removesnap/refs/heads/main/installflatpak.sh)
```