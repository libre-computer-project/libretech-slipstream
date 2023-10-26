# libretech-image-mounter

This simple tool mounts official Libre Computer images to enable modifications to be performed.

Please note that some images already have built-in mechanisms for first boot configuration.

* Raspbian has the firstrun.sh script.
* Ubuntu Base uses ignition.
* Ubuntu Server uses cloud-init.
* Debian Base uses ignition.

This tool allows you to make changes to the image for productization.

## Usage

```
git clone https://github.com/libre-computer-project/libretech-image-mounter.git
cd libretech-image-mounter

mkdir root
./lmount IMAGE root [SCRIPT]
```
