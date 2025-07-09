# !/usr/bin/bash




# remind user to keep note of the root decvice and swap device and boot device before running the script
# or save it locally somewhere


###################################################################################
#
#      _            _                _      _            _   _             
#   __| | _____   _(_) ___ ___    __| | ___| |_ ___  ___| |_(_) ___  _ __  
#  / _` |/ _ \ \ / / |/ __/ _ \  / _` |/ _ \ __/ _ \/ __| __| |/ _ \| '_ \ 
# | (_| |  __/\ V /| | (_|  __/ | (_| |  __/ ||  __/ (__| |_| | (_) | | | |
#  \__,_|\___| \_/ |_|\___\___|  \__,_|\___|\__\___|\___|\__|_|\___/|_| |_|
#
#
####################################################################################


# lsblk -f to get which block device is the device on which linux is installed.

# prompt user to enter absolute device path if the selected device is not the one on which user has installed their linux


root_dev=$(findmnt -n -o SOURCE / | sed 's/\[.*\]//')
disk=$(lsblk -no pkname "$root_dev")

echo "We have determined:"
echo "Linux root is on partition: $root_dev"
echo "Underlying disk device is: /dev/$disk"
echo ""

read -rp "Is this information correct? (y/n): " devicePrompt

if [[ "$devicePrompt" =~ ^[Yy]$ ]]; then
    echo "Continuing with detected devices..."
else
    read -rp "Enter the partition for root (e.g., /dev/nvme0n1p5): " root_dev
    read -rp "Enter underlying disk device (e.g., nvme0n1): " disk

    echo "User Entered:"
    echo "Linux root is on partition: $root_dev"
    echo "Underlying disk device is: /dev/$disk"
fi



#

################################################################################
#
#   __ _ _                      _                        _               _    
#  / _(_) | ___   ___ _   _ ___| |_ ___ _ __ ___     ___| |__   ___  ___| | __
# | |_| | |/ _ \ / __| | | / __| __/ _ \ '_ ` _ \   / __| '_ \ / _ \/ __| |/ /
# |  _| | |  __/ \__ \ |_| \__ \ ||  __/ | | | | | | (__| | | |  __/ (__|   < 
# |_| |_|_|\___| |___/\__, |___/\__\___|_| |_| |_|  \___|_| |_|\___|\___|_|\_\
#                     |___/                                                   
#
################################################################################


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
