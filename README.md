# Setup scripts for virtual dev server

My setup scripts I use for creating a new virtual machine for PHP development. Many of the components are specific to my own needs, such as installed packages and configurations. Still, feel free to fork it and modify it for your own usage.

`wget -O setup.sh http://goo.gl/vcJxVA`

## Instructions

1. Install Ubuntu 16.04 in a new VirtualBox machine
2. Login and select `Devices` -> `Insert Guest Additions CD Image...` from the VirtualBox menu
3. Run the `setup.sh` script to install and configure the machine

After the machine has been installed, you only need to setup your shared folder(s) and port forwarding. Everything else is ready to go. You can connect to MySQL via any database management program on your host, like MySQL Workbench.

A few of the actions in the script assume your shared folder will be `/media/sf_Web`. You can modify the `serve.sh` and `setup.sh` scripts to your own situation.

## Installed components

- Apache
- PHP 7.0
- XDebug
- MySQL (Password: secret)
- SSH Key Generation
- `serve` script to automatically create new VirtualHosts.
- My bash aliases
