#!/bin/bash
apt-get install -y openssh-server
cd /RV/inst/
MACADDR=$(ifconfig eth0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')
#could also be cat /sys/class/net/eth0/address
echo $MACADDR > /RV/inst/mac.txt
cd /home/bak/
wget http://download.beyondtrust.com/PBISO/8.2/linux.deb.x64/pbis-open-8.2.0.2969.linux.x86_64.deb.sh
chmod +x $(ls | grep pbis)
cp /RV/inst/APSinstall/domainLink.sh .
chmod +x ./domainLink.sh
#remember to change “sufficient” to “[success=ok default=ignore]” in /etc/pam.d/common-session
printf "[SeatDefaults]\nallow-guest=false\n" > /usr/share/lightdm/lightdm.conf.d/50-no-guest.conf

sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
apt-get update
apt-get install -y google-chrome-stable

apt-get install -y unattended-upgrades
cp /RV/inst/APSinstall/10periodic /etc/apt/apt.conf.d/
cp /RV/inst/APSinstall/50unattended-upgrades /etc/apt/apt.conf.d/
