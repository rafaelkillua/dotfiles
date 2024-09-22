#!/bin/sh

function ask_yes_or_no() {
  read -p "$1 ([y]es or [N]o): "

  case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
    y|yes) echo "yes" ;;
    *)     echo "no" ;;
  esac
}

if ! type -P yay; then
  sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
  echo 'Installed yay'
fi

if [[ "yes" == $(ask_yes_or_no "Install base dependencies?") ]]; then
  yay -S alacritty apulse chezmoi discord firefox-beta-bin flameshot google-chrome gparted headsetcontrol htop i3-back-bin iptvnator lightdm-settings lightdm-slick-greeter meld nemo-fileroller nextdns refind rofi rofi-greenclip scrcpy
  echo 'Installed base dependencies'
fi

if [[ "yes" == $(ask_yes_or_no "Install dev dependencies?") ]]; then
  yay -S android-sdk-build-tools android-sdk-cmdline-tools-latest android-sdk-platform-tools dbeaver docker extra/jdk21-openjdk rpi-imager visual-studio-code-bin watchman-bin
  echo 'Installed dev dependencies'
fi


