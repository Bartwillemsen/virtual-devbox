# Setup scripts for virtual dev server

My setup scripts I use for creating a new virtual machine for PHP development. Many of the components are specific to my own needs, such as installed packages and such. Still, feel free to fork it and modify it for your own usage.

## How to use

Install a fresh Ubuntu Server machine in VirtualBox. Login to it and insert the Guest Additions. (`Devices` -> `Insert Guest Additions CD Image...` from the machine's menu). Just insert it, the installation will be done in the script. Next, run the `setup.sh` file to install all the base components and configuration. After that, you only need to setup your shared folders and configure port forwarding on your virtual machine. When that's done, everything is ready to go!

## Installed components

- Apache
- PHP 5.5
- XDebug
- MySQL
- `serve` script to automatically create new VirtualHosts.


