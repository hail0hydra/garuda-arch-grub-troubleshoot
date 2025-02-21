# remind user to keep note of the root decvice and swap device and boot device before running the script
#
#
# lsblk -f to get which block device is the device on which linux is installed.
#
# prompt user to enter absolute device path if the selected device is not the one on which user has installed their linux
#
#
# if the file system is btrfs then find out subvolumes and mountpoints and do that. If not: i.e. ext4 then chill out, simple mount
#
#
# after mounting swapon the thing. also ask user to check (propmt) if the selected device is swap or not
#
#
# mount the boot device (same prompt)
#
#
# arch-chroot /mnt
#
#
#
# pacman -S os-prober | pacman -S os-prober-btrfs
#
# sed -i '/GRUB_DISABLE_OS_PROBER/s/^[ \t]*#//' /etc/default/grub    # this will uncomment the os-prober thingy
#
#
#
# grub-install (accordingly to efi and normal system)
#
# grub-mkconfig -o /boot/grub/grub.cfg
#
#
# exit
#
#
# umount -R /mnt
#
#
#Remind user that we will reboot the system, so remove the usb drive if they want after system starts rebooting.
#
#
# reboot
