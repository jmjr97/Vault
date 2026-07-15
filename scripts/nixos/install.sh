#!/usr/bin/env bash

# format partitions
mkfs.fat -F 32 -n BOOT /dev/nvme0n1p1
mkswap -L swap /dev/nvme0n1p2
mkfs.ext4 -L arch /dev/nvme0n1p3

# mount partitions
mount /dev/nvme0n1p3 /mnt
mount -m /dev/nvme0n1p1 /mnt/boot
swapon /dev/nvme0n1p2

nixos-generate-config --root /mnt
