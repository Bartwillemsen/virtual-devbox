# Setup scripts for virtual dev server

My setup scripts I use for creating a new virtual machine for PHP development. Many of the components are specific to my own needs, such as installed packages and configurations. Still, feel free to fork it and modify it for your own usage.

`wget -O setup.sh http://goo.gl/vcJxVA`

## Instructions

1. Install Ubuntu 14.04 in a new VirtualBox machine
2. Login and select `Devices` -> `Insert Guest Additions CD Image...` from the VirtualBox menu
3. Run the `setup.sh` script to install and configure the machine

## Installed components

- Apache
- PHP 5.5
- XDebug
- MySQL (Password: secret)
- `serve` script to automatically create new VirtualHosts.
- My bash aliases

## Port Forwarding

You must configure port forwarding on your VBox in order to, for example, SSH into your Virtual PC from your host. You can access these options in your network settings from the virtual machine.

## Shared Folders

You can use shared folders to conveniently share your projects between the host and guest. This allows you to easily edit your files locally on your PC.
