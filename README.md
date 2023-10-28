# libretech-slipstream

Easy to use slipstreaming tool designed to customize [official Libre Computer images](https://distro.libre.computer/ci/) with additional software.
Ideal for integration and productization of images for deployment with a [scripted application installer](https://github.com/libre-computer-project/libretech-slipstream-examples).

This should not be used for individual deployment initialization. Please use the first boot configuration tool for that.

* Raspbian has the firstrun.sh script.
* Ubuntu Base uses ignition.
* Ubuntu Server uses cloud-init.
* Debian Base uses ignition.

## Requirements

* Linux 6.1+ host
* Downloaded and decompressed official Libre Computer image

## Usage

```
git clone https://github.com/libre-computer-project/libretech-slipstream.git
cd libretech-slipstream

./setup.sh # installs pre-requisites

sudo ./lcss IMAGE [SCRIPT] [EXPAND] [SHRINK]
```

## lmount Parameters

* IMAGE : filename of uncompressed image - please make reflink copy as this tool is destructive
* SCRIPT : optional parameter - script file to execute instead of dropping to chroot shell
* EXPAND : optional parameter - expand the image for extra space - int optionally suffixed with  M, G, or T, M assumed
* SHRINK : optional parameter - shrink the image while leaving space - int optionally suffixed with  M, G, or T, M assumed

## Examples

Example installation scripts can be found at [libretech-slipstream-examples](https://github.com/libre-computer-project/libretech-slipstream-examples).

```
sudo ./lcss debian-12-gnome-arm64+arm64.img
# create a virtual environment in debian-12-gnome-arm64+arm64.img for manual customization

sudo ./lcss debian-12-gnome-arm64+arm64.img ~/app1/install.sh
# run the app1 install script in debian-12-gnome-arm64+arm64.img

sudo ./lcss debian-12-gnome-arm64+arm64.img ~/app1/install.sh 1G
# run the app1 install script in debian-12-gnome-arm64+arm64.img and expand the image by 1GiB

sudo ./lcss debian-12-gnome-arm64+arm64.img ~/app1/install.sh 1G 512M
# run the app1 install script in debian-12-gnome-arm64+arm64.img and expand the image by 1GiB during installation and leave at least 512MiB of space when compacting the image
```

## Limitations

* Does not currently support GPT disk images
* Pre-requisite setup script is targeted for Debian
* Does not work for changes that require real system

## More

* [Libre Computer Community Page](https://hub.libre.computer/t/libre-computer-slipstream/3125).
