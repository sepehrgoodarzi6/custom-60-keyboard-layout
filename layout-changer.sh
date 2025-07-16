#!/bin/bash

# =================================================================
# Special thanks to ChatGPT for adding helpful comments and emojies! 
# =================================================================

# Ask for sudo upfront and keep it active
if ! sudo -v; then
  echo "Sudo access is required. Exiting..."
  exit 1
fi

install_keyd() {
    echo "🔧 Checking if keyd is installed..."
    
    if command -v keyd >/dev/null 2>&1; then
        echo "✅ keyd is already installed."
    else
        echo "📦 Installing keyd..."
        sudo apt update
        sudo apt install -y build-essential cmake pkg-config libevdev-dev

        git clone https://github.com/rvaiya/keyd.git /tmp/keyd
        cd /tmp/keyd || exit 1
        make
        sudo make install
        sudo systemctl enable keyd
        sudo systemctl start keyd

        echo "✅ keyd installed and service started."
    fi
}

# --- Function to check and install keyd ---
check_and_setup_keyd() {
  echo -e "\n🔍 Checking if 'keyd' is installed..."

  if ! command -v keyd &>/dev/null; then
    echo "❌ 'keyd' is not installed."

    echo -e "\n📦 Attempting to install 'keyd'..."

    # Try known package managers
    if command -v apt &>/dev/null; then
      sudo apt update
      install_keyd
      #sudo apt install keyd -y
      #git clone https://github.com/rvaiya/keyd
      #cd keyd
      #make && sudo make install
      sudo systemctl enable keyd
      sudo systemctl start keyd
      echo -e "\n🔎 Final 'keyd' service status:"
      systemctl is-enabled keyd && systemctl is-active keyd

    elif command -v dnf &>/dev/null; then
      sudo dnf install -y keyd
    elif command -v pacman &>/dev/null; then
      sudo pacman -Sy --noconfirm keyd
    else
      echo "❌ Could not detect a supported package manager. Please install 'keyd' manually."
      exit 1
    fi
  else
    echo "✅ 'keyd' is installed."
  fi

  echo -e "\n🔧 Checking if 'keyd' service is enabled..."
  if ! systemctl is-enabled keyd.service &>/dev/null; then
    echo "🔄 Enabling 'keyd' service..."
    sudo systemctl enable keyd.service
  else
    echo "✅ 'keyd' is enabled."
  fi

  echo -e "\n🚀 Checking if 'keyd' service is running..."
  if ! systemctl is-active keyd.service &>/dev/null; then
    echo "🔄 Starting 'keyd' service..."
    sudo systemctl start keyd.service
  else
    echo "✅ 'keyd' is already running."
  fi
}

# Run the function
check_and_setup_keyd

sudo cp ~/keyboard-layout-changer/us.* /usr/share/X11/xkb/symbols/
sudo cp ~/keyboard-layout-changer/default.conf.*  /etc/keyd/

# Prompt user for layout option
echo -e "\n🧭 Choose a configuration option:"
echo "1) Restore original layout"
echo "2) Apply Baytion layout"
read -rp "Enter 1 or 2: " option

case $option in
  1)
    echo "🔁 Restoring original configuration..."
    sudo cp /usr/share/X11/xkb/symbols/us.original.bak /usr/share/X11/xkb/symbols/us
    sudo cp /etc/keyd/default.conf.original.bak /etc/keyd/default.conf
    ;;
  2)
    echo "🛠️ Applying Baytion configuration..."
    sudo cp /usr/share/X11/xkb/symbols/us.baytion.bak /usr/share/X11/xkb/symbols/us
    sudo cp /etc/keyd/default.conf.baytion.bak /etc/keyd/default.conf
    ;;
  *)
    echo "❌ Invalid option. Exiting..."
    exit 1
    ;;
esac

Check keyd service status
echo -e "\nFinal 'keyd' service status:"
sudo systemctl status keyd.service --no-pager

sudo systemctl restart keyd.service
# Check keyd service final status
echo -e "\n🔎 Final 'keyd' service status check:"

# Check if enabled
if systemctl is-enabled keyd.service &>/dev/null; then
  echo "✅ 'keyd' is enabled."
else
  echo "❌ 'keyd' is NOT enabled."
fi

# Check if running
if systemctl is-active keyd.service &>/dev/null; then
  echo "✅ 'keyd' is running."
else
  echo "❌ 'keyd' is NOT running."
fi

# Notify about logout
echo -e "\n⚠️ You will be logged out in 30 seconds."
echo "💾 Please save any unsaved work now!"
sleep 30

# Ask for display manager to restart
echo -e "\n🖥️ Choose your display manager:"
echo "1) GDM (GNOME)"
echo "2) LightDM (XFCE, MATE, etc.)"
echo "3) SDDM (KDE Plasma)"
read -rp "Enter 1, 2 or 3: " dm_choice

case $dm_choice in
  1)
    sudo systemctl restart gdm
    ;;
  2)
    sudo systemctl restart lightdm
    ;;
  3)
    sudo systemctl restart sddm
    ;;
  *)
    echo "⚠️ Invalid choice. Not restarting any display manager."
    ;;
esac

