#!/bin/bash

#
# This file is called from Kickstart to
# finalize the container installation
#

set -e

apt-get -y update
apt-get -y install python3 python3-pip jupyter r-base  gdebi-core
pip3 install pylint flask


cd /tmp
curl -o /tmp/rstudio-server.deb https://download2.rstudio.org/rstudio-server-1.1.463-amd64.deb
gdebi -n /tmp/rstudio-server.deb

## Workaround of apparmor bug:
echo "server-app-armor-enabled=0" >> /etc/rstudio/rserver.conf

echo "www-address=0.0.0.0"   >> /etc/rstudio/rserver.conf
echo "www-port=4200"           >> /etc/rstudio/rserver.conf


ln -s /opt /home/user/opt
## Set rstudio password to "pass":
usermod -p `openssl passwd pass` user

