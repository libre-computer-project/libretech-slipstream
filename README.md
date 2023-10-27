# libretech-image-mounter

This simple tool to mount [official Libre Computer images](https://distro.libre.computer/ci/) for modifications to be performed.

Please note that some images already have built-in mechanisms for first boot configuration.

* Raspbian has the firstrun.sh script.
* Ubuntu Base uses ignition.
* Ubuntu Server uses cloud-init.
* Debian Base uses ignition.

This tool allows you to make changes to the image for productization. Please use a Linux 6.1+ host kernel.

## Usage

```
git clone https://github.com/libre-computer-project/libretech-image-mounter.git
cd libretech-image-mounter

./setup.sh # installs pre-requisites

mkdir root
./lmount IMAGE root [SCRIPT]
```

## TODO

* Resize support
