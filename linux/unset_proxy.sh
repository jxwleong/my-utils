#!/usr/bin/bash

# Ref: https://gist.github.com/nathanchrs/a5e8c20bb3e1698bb2ca424c35ec4298


printf "\n Author: JasonLXW @jxwleong"
printf "\n Credit: @nathanchrs"
printf "\n This script will unset the proxy for linux"

printf "\n\n Unsetting enviroment proxy..."
http_proxy=
https_proxy=
printf " DONE"


printf "\n Unsetting Gnome proxy..."
gsettings set org.gnome.system.proxy mode 'none';

printf " DONE"


printf "\n\n Sudo is required to write to /etc/apt/apt.conf.d/proxy.conf"
printf "\n Unsetting apt proxy...\n"
sudo rm /etc/apt/apt.conf.d/proxy.conf
printf " DONE"

# Snap set cause 
# error: the required argments '<snap>' and '<conf value>' (at were not provided)'
#printf "\nUnsetting snap proxy..."
#snap unset system.proxy.http
#snap unset system.proxy.https

#printf " DONE"
printf "\n\n Proxy is disabled."