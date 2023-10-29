printf "\ec\e[43;37m"
unzip bin.zip 
dd if=/dev/zero of="hard.img" bs=1M count=10
sudo mkfs.vfat -n 'HARD' -S 512  "hard.img"
sudo mkdir /mnt/new
sudo chmod 777 /mnt/new
mount -t vfat -o loop "hard.img" /mnt/new
mkdir /mnt/new/syslinux/
mkdir /mnt/new/boot/
umount  /mnt/new
syslinux hard.img

