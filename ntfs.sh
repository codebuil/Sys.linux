printf "\ec\e[43;37m"
unzip bin.zip -a
dd if=/dev/zero of="hard.img" bs=1M count=150
sudo mkfs.ntfs "hard.img" -F -L "hard" -S 63 -p 0 -s 512 -H 63
sudo mkdir /mnt/new > /dev/null
sudo chmod 777 /mnt/new
mount -t ntfs -o loop "hard.img" /mnt/new
mkdir /mnt/new/syslinux/
mkdir /mnt/new/syslinux/boot
mkdir /mnt/new/boot/
mkdir /mnt/new/boot/syslinux/
cp ./syslinux/*.* /mnt/new/syslinux/
cp ./syslinux/*.* /mnt/new/syslinux/boot
cp ./syslinux/*.* /mnt/new/syslinux/boot
umount  /mnt/new
echo syslinux
syslinux  "hard.img"

