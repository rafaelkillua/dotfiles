#!/bin/sh

function ask_true_or_false() {
  read -p "$1 ([y]es or [N]o): "

  case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
    y|yes) echo "true" ;;
    *)     echo "false" ;;
  esac
}

isVM=$(ask_true_or_false "Is this a VM?")

echo "[data]" | tee $HOME/.config/chezmoi/chezmoi.toml
echo "  isVM = $isVM" | tee -a $HOME/.config/chezmoi/chezmoi.toml
