## Install ARCH Linux with encrypted file-system and UEFI
- Below are only raw commands in order. The official [installation guide](https://wiki.archlinux.org/index.php/Installation_Guide) contains a more verbose description.

### Steps :
- Download the archiso image from https://www.archlinux.org/ and copy it to a usb-drive:
```shell
dd if=archlinux.img of=/dev/sdX bs=16M && sync
```
- Boot from the usb (if the usb fails to boot, make sure that secure boot is disabled in the BIOS configuration)
- Set fr keyboard layout:
```shell
loadkeys fr-pc
```
- If you need to connect to wifi:
```shell
wifi-menu
```
timedatectl set-ntp true

- Create partitions
```shell
cgdisk /dev/sdX
```
	1 512MB Boot partition # Hex code 8300

```shell
mkfs.vfat -F32 /dev/sdX1
mkfs.ext2 /dev/sdX2
```
- Setup the encryption of the system
```shell
cryptsetup -y -v luksFormat /dev/sdX3
cryptsetup open /dev/sdX3 luks
```
- Create encrypted partitions
- This creates one partions for root, modify if /home or other partitions should be on separate partitions

- Create filesystems on encrypted partitions
```shell
mkfs.ext4 /dev/mapper/root
```
- Mount the new system
```shell
mount /dev/mapper/root /mnt # /mnt is the installed system
swapon /dev/sda2 # Not needed but a good thing to test
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
#obsolet depend on iso image mkdir /mnt/boot/efi
```

- Install the system also includes stuff needed for starting wifi when first booting into the newly installed system
- Unless vim and zsh are desired these can be removed from the command
```shell
pacstrap /mnt base base-devel zsh vim git #dialog wpa_supplicant
```
- 'install' fstab
```shell
genfstab -p -U /mnt >> /mnt/etc/fstab
```
- Change relatime on all non-boot partitions to noatime (reduces wear if using an SSD)
- Enter the new system
```shell
arch-chroot /mnt
```
- Setup system clock
```shell
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc --utc
```
- Set the hostname
```shell
echo MYHOSTNAME > /etc/hostname
```
- Update locale
    vim /etc/locale-gen
    locale-gen
    locale
    locale > /etc/locale.conf
    localectl
    localectl set-locale LANG=fr_FR.UTF-8

echo LANG=en_US.UTF-8 >> /etc/locale.conf
echo LANGUAGE=en_US >> /etc/locale.conf
echo LC_ALL=C >> /etc/locale.conf


- Set password for root
```shell
passwd
```
- Add real user remove -s flag if you don't whish to use zsh
- useradd -m -g users -G wheel -s /bin/zsh MYUSERNAME
- add /etc/hosts
- pacman -S networkmanager
- systemctl enable NetworkManager
- passwd MYUSERNAME
- Configure mkinitcpio with modules needed for the initrd image
```shell
vim /etc/mkinitcpio.conf
```
- Add 'consolefont' 'keymap' and 'encrypt' (in this order) to HOOKS before filesystems
- Regenerate initrd image
```shell
mkinitcpio -p linux
```

bootctl --path=/boot/ install
vim /boot/loader/loader.conf
vim /boot/loader/entries/arch.conf



ip link
systemctl --type=service
systemctl status dhcpcd.service
systemctl enable dhcpcd.service
systemctl start dhcpcd.service


pacman -Sy sudo
sed 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers > /etc/sudoers.new

vim /etc/profile.d/editor.sh
export EDITOR=vim

visudo
rm /etc/sudoers.new


useradd -m jb




- mounting crypted home at login: add this line in /etc/pam.d/system-login file
```shell
auth       include    system-auth
auth       optional   pam_exec.so expose_authtok /etc/pam_cryptsetup.sh
```

chsh -s /usr/bin/zsh


