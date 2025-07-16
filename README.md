# Keyboard Layout Changer (Baytion Edition)

This script installs and configures `keyd` and toggles between the original and a custom (Baytion) keyboard layout on Linux systems using X11 and keyd.

## Features

- Installs and configures `keyd` service
- Replaces `/usr/share/X11/xkb/symbols/us` with either:
  - `us.original.bak` (original layout)
  - `us.baytion.bak` (custom layout)
- Manages `/etc/keyd/default.conf` using backups
- Restarts the display manager (GNOME, XFCE, KDE)

## Usage

```bash
chmod +x layout-changer.sh
./layout-changer.sh
