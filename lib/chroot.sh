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

	local resolv_conf_path='/etc/resolv.conf'
	local resolv_conf="${1}${resolv_conf_path}"
	if [ -L "$resolv_conf" ]; then
		local resolv_conf=$(readlink -m "$resolv_conf")
		local resolv_conf_length=${#resolv_conf}
		if [ "${resolv_conf:0:${#1}}" != "$1" ]; then
			echo "$FUNCNAME: resolv.conf symlinked to absolute path outside of the chroot." >&2
			local resolv_conf="$1$resolv_conf"
		fi
		if [ ! -f "$resolv_conf" ]; then
			mkdir -p "${resolv_conf%/*}"
			cp "$resolv_conf_path" "$resolv_conf"
			traps_push rm "$resolv_conf"
		fi
	elif [ ! -f "$resolv_conf" ]; then
		cp "$resolv_conf_path" "$resolv_conf"
		traps_push rm "$resolv_conf"
	fi
}
