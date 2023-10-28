# libretech-image-mounter

Simple tool to mount and resize [official Libre Computer images](https://distro.libre.computer/ci/) for customization.
Ideal for productization of images for deployment via scripted application installation.

Please note that some images already have built-in mechanisms for first boot configuration.

* Raspbian has the firstrun.sh script.
* Ubuntu Base uses ignition.
* Ubuntu Server uses cloud-init.
* Debian Base uses ignition.

## Requirements

* Linux 6.1+ host
* Downloaded and decompressed official Libre Computer image

## Usage

```
git clone https://github.com/libre-computer-project/libretech-image-mounter.git
cd libretech-image-mounter

./setup.sh # installs pre-requisites

sudo ./lmount IMAGE [SCRIPT] [EXPAND] [SHRINK]
```

## lmount Parameters

* IMAGE : filename of uncompressed image - please make reflink copy as this tool is destructive
* SCRIPT : optional parameter - script file to execute instead of dropping to chroot shell
* EXPAND : optional parameter - expand the image for extra space - int optionally suffixed with  M, G, or T, M assumed
* SHRINK : optional parameter - shrink the image while leaving space - int optionally suffixed with  M, G, or T, M assumed
