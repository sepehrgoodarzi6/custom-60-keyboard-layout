# custom-60-keyboard-layout
Custom Keyboard Layout for 60% Keyboards (XKB - Linux)
# Custom Keyboard Layout for 60% Keyboards (XKB - Linux)

This project provides a custom keymap layout for 60% mechanical keyboards on Linux (X11), enabling remapping of hard-to-reach or missing keys such as `/`, `?`, `>` and `<`.

## Problem

On 60% keyboards, some essential keys like `/` and `?` are placed awkwardly or require multiple function layers. This layout fixes the key mappings to make them more intuitive and accessible using the Right Shift as a Level 3 modifier (AltGr).

## What It Does

- Remaps `<AB08>` and `<AB09>` to allow comma, less, greater, slash, period, question mark, etc. with Shift and AltGr.
- Converts **Right Shift** (`keycode 62`) into **ISO_Level3_Shift (AltGr)**.
- Adds support for FOUR_LEVEL type key behavior.

## Layout Changes

### `/usr/share/X11/xkb/symbols/us` ➜ `~/custom_us`

```xkb
key <AB08> {
    type= "FOUR_LEVEL",
    symbols[Group1]= [ comma, less, greater, question ]
};

key <AB09> {
    type= "FOUR_LEVEL",
    symbols[Group1]= [ slash, period, question, greater ]
};
