# Setup scripts for virtual dev server

My setup scripts I use for creating a new virtual machine for PHP development. Many of the components are specific to my own needs, such as installed packages and such. Still, feel free to fork it and modify it for your own usage.

## How to use

Install a fresh Ubuntu (Server) machine in VirtualBox. Login to it and insert the Guest Additions (`Devices` -> `Insert Guest Additions CD Image...` from the machine's menu). Run the `setup.sh` file to install all the base components and configuration. After that, you only need to setup your shared folders and configure port forwarding on your virtual machine. After that, everything is set!

## Installed components

- Apache
- PHP 5.5
- XDebug
- MySQL
- Default PHP Info site (via http://info.app)


