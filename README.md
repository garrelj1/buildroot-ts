
# embeddedTS Buildroot
This repository implements BR_EXTERNAL for embeddedTS products. Currently this includes support for:

* TS-4100
* TS-4900
* TS-7100 (via ts7250v3_defconfig)
* TS-7250-V3
* TS-7553-V2
* TS-7680
* TS-7840
* TS-7970
* TS-TPC-7970


## Getting Started
This project implements a tagged release from upstream Buildroot as a submodule. This allows for this project to be used as it is to build whole Buildroot projects, or it can be integrated as a BR2_EXTERNAL directory for custom implementations.

The repository and the Buildroot submodule can all be cloned in a single command with:

	git clone --recurse-submodules https://github.com/embeddedTS/buildroot-ts.git
	cd buildroot-ts

From here, projects can be built, for example, this will generate a minimal TS-7250-V3 image:

	make ts7250v3_defconfig all

The output files will be located in `buildroot/output/images/`

As this uses Buildroot as a git submodule, its possible to change which branch/tag is used by Buildroot. For example, to checkout a specific tag:

	cd buildroot
	git checkout <tag>
	cd ..
	make <defconfig>
	make

This will output a Buildroot image built from the specified tag. The buildroot version can be reverted with the same init command used above:

	git submodule update --init

We will update the Buildroot release tag used as time goes on, we will only push these updates to the repository once they have been tested by us to ensure compatibility.


## Build instructions

| Product | Buildroot base defconfig | USB Image Replicator |
|---------|--------------------------|-------------------------|
| TS-4100 | [ts4100_defconfig](#ts4100_defconfig) | [tsimx6ul_usbprod_defconfig](#tsimx6ul_usbprod_defconfig) |
| TS-4900 | | [tsimx6_usbprod_defconfig](#tsimx6_usbprod_defconfig) |
| TS-7100 | [ts7250v3_defconfig](#ts7250v3_defconfig) | [ts7250v3_usbprod_defconfig](#ts7250v3_usbprod_defconfig) |
| TS-7250-V3 | [ts7250v3_defconfig](#ts7250v3_defconfig) | [ts7250v3_usbprod_defconfig](#ts7250v3_usbprod_defconfig)  |
| TS-7553-V2 | [ts7553v2_defconfig](#ts7553v2_defconfig) | [tsimx6ul_usbprod_defconfig](#tsimx6ul_usbprod_defconfig) |
| TS-7680 | [ts7680_defconfig](#ts7680_defconfig) |  |
| TS-7840 | [tsa38x_defconfig](#tsa38x_defconfig) | [tsa38x_usbprod_defconfig](#tsa38x_usbprod_defconfig) |
| TS-7970 | | [tsimx6_usbprod_defconfig](#tsimx6_usbprod_defconfig) |
| TS-TPC-7990 | | [tsimx6_usbprod_defconfig](#tsimx6_usbprod_defconfig) |


### ts4100_defconfig
* Supports TS-4100 devices
* Generates a minimal Linux with hardware support
* Outputs `rootfs.tar.xz` which can be written to any boot device for the platform: USB, SD, eMMC, etc.

Can be built with (See [Using Docker](#using-docker) for how to build in Docker container):

	make ts4100_defconfig all

### ts7250v3_defconfig
* Supports TS-7250-V3 and TS-7100 devices
* Generates a minimal Linux with hardware support
* Outputs `rootfs.tar.gz` which can be written to any boot device for the platform: USB, eMMC, etc.

Can be built with (See [Using Docker](#using-docker) for how to build in Docker container):

	make ts7250v3_defconfig all

### ts7553v2_defconfig
* Supports TS-7553-V2 devices
* Generates a minimal Linux with hardware support (based on 4.9 kernel)
* Outputs `rootfs.tar.xz` which can be written to any boot device for the platform: USB, SD, eMMC, etc.

Can be built with (See [Using Docker](#using-docker) for how to build in Docker container):

	make ts7553v2_defconfig all

### ts7680_defconfig
* Supports TS-7680 devices
* Upstream support provided by Buildroot, configuration file not directly in this repository
* This repository provides the following useful configuration options not in upstream Buildroot (be sure to enable them if desired):
	* BR2_PACKAGE_TS7680_UTILS (Utilities for TS-7680, `tshwctl`, `switchctl`, `tsmicroctl`, etc.)
	* BR2_PACKAGE_TSSILOMON_INIT (Enables TS-SILO script to run on startup)
 * Outputs `rootfs.tar` and `sdcard.img` which can be written to any boot device for the platform: USB, SD, eMMC, etc.

Can be built with (See [Using Docker](#using-docker) for how to build in Docker container):

	make ts7680_defconfig all

### tsa38x_defconfig
* Supports TS-7840 devices
* Generates a minimal Linux with hardware support (based on 5.10 kernel)
* Outputs `rootfs.tar.xz` which can be written to any boot device for the platform: USB, eMMC, SATA, NFS, etc.

Can be built with (See [Using Docker](#using-docker) for how to build in Docker container):

	make tsa38x_defconfig all

### tsimx6ul_usbprod_defconfig
* Image Replication tool for TS-4100 and TS-7553-V2 devices
* Able to capture disk images and/or write out disk images to all supported media on devices
* Outputs `tsimx6ul-usb-image-replicator-rootfs.tar.bz2` and `tsimx6ul-usb-image-replicator.dd` that can be written to a USB drive and booted on supported devices
* The `tsimx6ul-usb-image-replicator.dd` file is self expanding after first boot. It is intended to make the image capture process easier
* See the respective product manual for more information on the Image Replicator tool

Can be built with (See [Using Docker](#using-docker) for how to build in Docker container):

	make tsimx6ul_usbprod_defconfig all

### tsimx6_usbprod_defconfig
* Image Replication tool for TS-4900, TS-7970, and TS-TPC-7990 devices
* Able to capture disk images and/or write out disk images to all supported media on devices
* Outputs `tsimx6-usb-image-replicator-rootfs.tar.bz2` and `tsimx6-usb-image-replicator.dd` that can be written to a USB drive and booted on supported devices
* The `tsimx6-usb-image-replicator.dd` file is self expanding after first boot. It is intended to make the image capture process easier
* See the respective product manual for more information on the Image Replicator tool

Can be built with (See [Using Docker](#using-docker) for how to build in Docker container):

	make tsimx6_usbprod_defconfig all

### ts7250v3_usbprod_defconfig
* Supports TS-7250-V3 and TS-7100 devices
* Generates a tarball for use on a USB drive to boot the device, run a script named `blast.sh` from the drive to write and verify or capture images from the device media. See the respective product manual for information on this Production Mechanism.

Can be built with (See [Using Docker](#using-docker) for how to build in Docker container):

	make ts7250v3_usbprod_defconfig all
This outputs a tarball to `buildroot/output/images/ts7250v3-usb-production-rootfs.tar.bz2` intended to be written to a USB drive with one partition which is formatted either `ext2`, `ext3`, `ext4`, or `FAT32 (including vfat)` with an MBR or GPT partition table.

### ts7800v2_usbprod_defconfig
* Image Replication tool for the TS-7800-V2
* Able to capture disk images and/or write out disk images to all supported media on devices
* Outputs `ts7800v2-usb-image-replicator-rootfs.tar.bz2` and `ts7800v2-usb-image-replicator.dd` that can be written to a USB drive and booted on supported devices
* The `ts7800v2-usb-image-replicator.dd` file is self expanding after first boot. It is intended to make the image capture process easier
* See the respective product manual for more information on the Image Replicator tool

Can be built with (See [Using Docker](#using-docker) for how to build in Docker container):

	make ts7800v2_usbprod_defconfig all

### tsa38x_usbprod_defconfig
* Supports TS-7840 devices
* Generates a tarball for use on a USB drive to boot the device, run a script named `blast.sh` from the drive to write and verify or capture images from the device media. See the respective product manual for information on this Production Mechanism.


Can be built with (See [Using Docker](#using-docker) for how to build in Docker container):

	make tsa38x_usbprod_defconfig all
This outputs a tarball to `buildroot/output/images/tsa38x-usb-production-rootfs-${DATESTAMP}.tar.xz` intended to be written to a USB drive with one partition which is formatted either `ext2`, `ext3`, `ext4`, or `FAT32 (including vfat)` with an MBR or GPT partition table.


## Extra Packages

The platform defconfig files are very basic configurations; providing support for the base hardware with no additional tools. We've created an `extra_packages_defconfig` that can be merged with any of the above defconfig files to provide additional packages that are more in-line with the stock images for our devices.

Buildroot itself provides a script to merge and make the config file. Rather than running any of the above `make <platform>_defconfig` commands, instead run the merge script. For example, here is how to build the extra packages config for the TS-7553-V2:

    ./buildroot/support/kconfig/merge_config.sh technologic/configs/extra_packages_defconfig technologic/configs/ts7553v2_defconfig
    make

Simply substitute out the platform defconfig for other devices. Note that each defconfig provided to the script overrides any values set in the previous defconfig if they conflict. It is recommended to pass the extra_packages_defconfig before the device defconfig so any conflicts result in favoring the known base configuration file.

## Using Docker
Optionally, this can be built in a Docker container. The container is maintained in lock-step with this project and the upstream Buildroot submodule. Meaning it is possible to go back to a specific commit in history and get a valid environment for building in via Docker.

The container is implemented as a simple front-end script, any arguments passed to the script will be passed directly to the root `buildroot-ts/` directory inside of the container. The first time the script is run, it will build the container so this may take additional time.

For example, to use the TS-7250-V3 defconfig, open a menuconfig window, then start a build:

    ./scripts/run_docker_buildroot.sh make ts7250v3_defconfig menuconfig all

### Notes on using Docker

* Choose building either from the host workstation or Docker container, it is not recommended to mix and match. Do a `make clean` from one build system in order to be able to cleanly switch to another. Switching between the two without `make clean` in between will likely cause build issues
* The `pwd` is mapped to `/work/` inside the container, with `$HOME` being set to `/work/`. Any changes made inside of `/work/` will be retained, any changes to the rest of the container filesystem will be lost once the container is exited
* Most of our configs have ccache enabled though Buildroot. Normally, this lies at `~/.buildroot-ccache`. Inside the container however, the `buildroot-ts/` directory is set to `$HOME`. If relying on ccache in Buildroot, be sure to continually use the same build system to prevent excessive work
* It's possible to enter the shell of the container by passing `bash` to the script, i.e. `./scripts/run_docker_buildroot.sh bash`
