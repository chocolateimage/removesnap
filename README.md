# removesnap
Removes snaps from a default Ubuntu installation and installs the native counterparts. (Experimental)

Currently tested with:
- Ubuntu 25.04
- Ubuntu 24.10
- Ubuntu 24.04
- Ubuntu 22.04
- Kubuntu 25.10
- Kubuntu 25.04
- Kubuntu 24.10
- Kubuntu 24.04
- Xubuntu 24.10
- Xubuntu 24.04
- Lubuntu 24.04
- Edubuntu 24.04
- Ubuntu Budgie 24.04
- Ubuntu Cinnamon 24.04
- Ubuntu MATE 24.04

## Usage

> [!NOTE]
> Make sure to close all programs before executing the command and don't touch the computer during the process unless instructed to enter in a password or to restart.

> [!TIP]
> It's recommended to run this command after a release upgrade (for example 24.04 -> 24.10).
> Your Firefox profiles will be migrated automatically.

Copy and paste one of these commands into your terminal and press enter, make sure the system has been updated:

- **Remove Snaps + Setup Flatpak with Flathub (Recommended)**
```bash
bash <(wget -qO- https://raw.githubusercontent.com/chocolateimage/removesnap/refs/heads/main/installflatpak.sh)
```

- Remove Snaps
```bash
bash <(wget -qO- https://raw.githubusercontent.com/chocolateimage/removesnap/refs/heads/main/removesnap.sh)
```
