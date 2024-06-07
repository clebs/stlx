# Stlx
Styles for OSX, stlx for short, is a theme switcher for MacOSX.

## Disclaimer
This tool is currently an experiment and it has been tailored to my setup. That being said, I share it in hopes that it is useful for more people and to expand its features.

## Demo
https://github.com/clebs/stlx/assets/1059661/9ab1989b-86e5-456a-a213-4375138866a5





## Details
Stlx allows to choose between different themes and when selecting a theme it will apply the following:
- Terminal theme: Ghostty only at the moment, but might add support for other terminals.
- Neovim theme: themes need installation beforehand and you need to add `require('theme')` to your `ìnit.lua`.
- Wallpaper: changes the wallpaper for all desktops supporting 2 spaces at the moment.

## Installation
Clone the repository:
```bash
git clone https://github.com/clebs/stlx

```
Run the installation script:
```bash
cd stlx && ./install.sh
```

The script will ask for elevated permissions to symlink the main stlx program to `/usr/local/bin` for convenience.
If you do now want it linked, simply cancel the script when prompted for your password.

## Usage
After installation, run:
```bash
stlx
```
