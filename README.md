# Custom Keyboard Layout for 60% Keyboards (Linux XKB)

This project provides a clean and functional key remapping solution for 60% mechanical keyboards on Linux. It addresses the difficulty of accessing characters such as `/`, `?`, `<`, and `>` by redefining key behavior using XKB and repurposing the **Right Shift** key as a **Level 3 (AltGr)** modifier.

---

**Features**

- Remaps keys `<AB08>` and `<AB09>` to provide access to `comma`, `less`, `greater`, `slash`, `period`, and `question` via multi-level input.
- Configures **Right Shift** (`<RTSH>`, keycode 62) to function as `ISO_Level3_Shift` (AltGr), enabling four-level input.
- Fully compatible with X11 systems on most Linux distributions (Ubuntu, Debian, etc.).

---

**Modified Key Definitions**

```xkb
key <AB08> {
    type= "FOUR_LEVEL",
    symbols[Group1]= [ comma, less, greater, question ]
};

key <AB09> {
    type= "FOUR_LEVEL",
    symbols[Group1]= [ slash, period, question, greater ]
};

key <RTSH> { [ ISO_Level3_Shift ] };
Installation

Clone the Repository

bash
Copy
Edit
git clone https://github.com/yourusername/custom-60-keyboard-layout.git
cd custom-60-keyboard-layout
Run the Installer

bash
Copy
Edit
chmod +x custom_layout_installer.sh
./custom_layout_installer.sh
Reboot the System

bash
Copy
Edit
sudo reboot
Restore Original Configuration (Optional)

If needed, you can restore the default XKB layout files:

bash
Copy
Edit
sudo cp /usr/share/X11/xkb/symbols/us.bak /usr/share/X11/xkb/symbols/us
sudo cp /usr/share/X11/xkb/symbols/pc.bak /usr/share/X11/xkb/symbols/pc
License

MIT License
© 2025 Sepehr Goodarzi

See the LICENSE file for details.

yaml
Copy
Edit
