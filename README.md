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
```

## Requirements

- Debian/Ubuntu system  
- `sudo` access  
- Internet connection  

---

## File Structure

| File                        | Description                  |
|-----------------------------|------------------------------|
| `layout-changer.sh`         | Main script                  |
| `default.conf.baytion.bak`  | Custom keyd config           |
| `default.conf.original.bak` | Backup of original keyd config |
| `us.baytion.bak`            | Custom keyboard layout       |
| `us.original.bak`           | Backup of original keyboard layout |
