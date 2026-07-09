#!/bin/bash
# ======================================================================
# File: vm-launcher.sh
# Desc: script to launch virtual machines through rofi
# ======================================================================

menu() {
  printf "1. Arch i3\n"
  printf "2. Arch Openbox\n"
  printf "3. Window 11\n"
}

main() {
  choice=$(menu | rofi -dmenu -m -1 -i -p "Selection:"| cut -d. -f1)

  case $choice in
    1)
      virsh --connect qemu:///system start "arch-i3"
      virt-manager --connect qemu:///system --show-domain-console "arch-i3"
      break
      ;;
    2)
      virsh --connect qemu:///system start "arch-openbox"
      virt-manager --connect qemu:///system --show-domain-console "arch-openbox"
      break
      ;;
    3)
      virsh --connect qemu:///system start "win11"
      virt-manager --connect qemu:///system --show-domain-console "win11"
      break
      ;;
  esac
}

main
