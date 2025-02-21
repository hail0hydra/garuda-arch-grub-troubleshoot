## What is this?


- I use a dual boot environment of Win11 with Garuda linux. Many-a-times I have faced the issue of either when windows updates or garuda does, the __GRUB Bootloader__ dissapears.

- The next time when I try to power-on my system, I am mostly faced with __grub rescue>__ mode 😢.

- I talked about this with my fellow ___dual-boot-arch linux___ users, and we all faced this issue. Although the solution is quite simple to `chroot` into your system via a live bootable arch, and then reinstall grub like:

<br>

```bash
grub-install --target=whatever_fits_for_you --bootloader_id=GRUB/garuda_whatever #... basically this thing

grub-mkconfig -o /boot/grub/grub.cfg
```


<br>

- and making sure to turn on `os-prober` (assuming it is installed already) in the file `/etc/default/grub` like:


<br>

```bash
GRUB_DISABLE_OS_PROBER=false #uncommenting this line
```

 and then rebooting the system...


<br>
<br>
<br>


But the case with `btrfs` file systems is that you have to first mount the _subvolumes_ and then __chroot__. And what if you dont know your subvolumes?



For that I have made this simple script :)


I wont have to do all tasks again and again, this script will do that for me.


<br>
<br>
<br>

> [!WARNING] ⚠️
>
-  Keep in mind the script is to be executed once you are in the live boot of arch. Just `git clone` this (also install git before that) and then run this script.

