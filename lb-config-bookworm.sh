LB_IMAGE_NAME="debian-bookworm-live" lb config \
	--architecture arm64 \
	--bootstrap-qemu-arch arm64 \
	--bootstrap-qemu-static /usr/bin/qemu-aarch64-static \
	--archive-areas 'contrib main non-free non-free-firmware' \
	--parent-archive-areas 'contrib main non-free non-free-firmware' \
	--debian-installer netinst \
	--debian-installer-distribution bookworm \
	--distribution bookworm \
	--distribution-chroot bookworm \
	--distribution-binary bookworm\
	--bootloaders grub-efi \
	--keyring-packages "debian-archive-keyring ca-certificates fontconfig-config initramfs-tools" \
	--linux-packages "linux-image linux-dtb" \
	--linux-flavours "legacy-rk35xx" \
	--parent-mirror-bootstrap "http://ftp.debian.org/debian/" \
	--parent-mirror-chroot "http://ftp.debian.org/debian/" \
	--parent-mirror-chroot-security "http://security.debian.org/debian-security/" \
	--parent-mirror-binary "http://ftp.debian.org/debian/" \
	--parent-mirror-binary-security "http://security.debian.org/debian-security/" \
	--parent-mirror-debian-installer "http://ftp.debian.org/debian/" \
	--mirror-bootstrap "http://ftp.debian.org/debian/" \
	--mirror-chroot "http://ftp.debian.org/debian/" \
	--mirror-chroot-security "http://security.debian.org/debian-security/" \
	--mirror-binary "http://ftp.debian.org/debian/" \
	--mirror-binary-security "http://security.debian.org/debian-security/" \
	--mirror-debian-installer "http://ftp.debian.org/debian/"

cp additional-packages config/package-lists/additional-packages.list.chroot

mkdir -p config/includes.chroot_after_packages/etc/netplan
cp networkmanager.yaml config/includes.chroot_after_packages/etc/netplan

cp customize-chroot.hook.chroot config/hooks/live
mkdir -p config/includes.chroot_after_packages/etc/grub.d/
cp 10_linux config/includes.chroot_after_packages/etc/grub.d/
