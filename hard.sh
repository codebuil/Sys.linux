printf "\ec\e[43;37m"
unzip bin.zip 
dd if=/dev/zero of="hard.img" bs=1M count=4
sudo mkfs.vfat -n 'HARD' -S 512  "hard.img"
sudo mkdir /mnt/new
sudo chmod 777 /mnt/new
mount -t vfat -o loop "hard.img" /mnt/new
mkdir /mnt/new/syslinux/
mkdir /mnt/new/syslinux/boot
mkdir /mnt/new/boot/
mkdir /mnt/new/boot/syslinux/
cp ./syslinux/*.* /mnt/new/syslinux/
cp ./syslinux/*.* /mnt/new/syslinux/boot
cp ./syslinux/*.* /mnt/new/syslinux/boot
umount  /mnt/new
syslinux hard.img

