#!/usr/bin/bash

# Ref: https://gist.github.com/nathanchrs/50a8b51fd4d84d92fe07b5dc2881c860


PROXY_HOST=""
HTTP_PROXY_PORT=""
HTTPS_PROXY_PORT=""

HTTP_PROXY_STR="http://$PROXY_HOST:$HTTP_PROXY_PORT"
HTTPS_PROXY_STR="https://$PROXY_HOST:$HTTP_PROXY_PORT"

APT_PROXY_CONF="Acquire {
  HTTP::proxy \"$HTTP_PROXY_STR\";
  HTTPS::proxy \"$HTTPS_PROXY_STR\";
}"

printf "\n Author: JasonLXW @jxwleong"
printf "\n Credit: @nathanchrs"
printf "\n This script will set the proxy for linux"
printf "\n\n Proxy will be configured based on the addresses: "
printf "\n HTTP: \"$HTTP_PROXY_STR\""
printf "\n HTTPS: \"$HTTPS_PROXY_STR\""


printf "\n\n Setting enviroment proxy..."
http_proxy=$HTTP_PROXY_STR
https_proxy=$HTTPS_PROXY_STR
printf " DONE"


printf "\nSetting Gnome proxy..."
gsettings set org.gnome.system.proxy mode 'manual';

gsettings set org.gnome.system.proxy.http host "'$PROXY_HOST'";
gsettings set org.gnome.system.proxy.http port $HTTP_PROXY_PORT;

gsettings set org.gnome.system.proxy.https host "'$PROXY_HOST'";
gsettings set org.gnome.system.proxy.https port $HTTPS_PROXY_PORT;

printf " DONE"


printf "\n\n Sudo is required to write to /etc/apt/apt.conf.d/proxy.conf"
printf "\n Setting apt proxy..."
echo "$APT_PROXY_CONF" | sudo tee /etc/apt/apt.conf.d/proxy.conf > /dev/null
printf " DONE"

# Snap set cause 
# error: the required argments '<snap>' and '<conf value>' (at were not provided)'
#printf " \nSetting snap proxy..."
#snap set system.proxy.http=\"$HTTP_PROXY_STR\"
#snap set system.proxy.https=\"$HTTPS_PROXY_STR\"

#printf " DONE"
printf "\n\n Proxy is enabled."