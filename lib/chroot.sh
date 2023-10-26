CHROOT_mount(){
	mount -o bind /dev "$1/dev"
	traps_push umount "$1/dev"
	mount -o bind /dev/pts "$1/dev/pts"
	traps_push umount "$1/dev/pts"
	
	chroot "$1" mount -t proc proc proc
	traps_push chroot "$1" umount /proc
	chroot "$1" mount -t sysfs sys sys
	traps_push chroot "$1" umount /sys
	chroot "$1" mount -t tmpfs tmpfs /run
	traps_push chroot "$1" umount /run
}