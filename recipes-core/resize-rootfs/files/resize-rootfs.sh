#!/bin/sh
# Grow the root partition and filesystem to the end of the SD card.
# The caller (systemd unit or init script) disables itself on success, so
# this only runs once.

set -e

ROOT_DEV=$(findmnt -n -o SOURCE /)
PKNAME=$(lsblk -n -o PKNAME "$ROOT_DEV")
[ -n "$PKNAME" ] || exit 0
DISK=/dev/$PKNAME
PART=${ROOT_DEV##*/}
PARTNUM=$(cat "/sys/class/block/$PART/partition")

echo ", +" | sfdisk -N "$PARTNUM" --no-reread "$DISK"
partx -u "$DISK"

# resize2fs would silently do nothing if the kernel still had the old
# partition size, so make sure it picked up the new one.
DISK_SECTORS=$(partx -g -o SECTORS -n "$PARTNUM" "$DISK" | tr -d ' ')
KERNEL_SECTORS=$(cat "/sys/class/block/$PART/size")
if [ "$DISK_SECTORS" != "$KERNEL_SECTORS" ]; then
    echo "Kernel did not pick up the new size of $ROOT_DEV" >&2
    exit 1
fi

resize2fs "$ROOT_DEV"
