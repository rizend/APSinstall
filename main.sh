#!/bin/bash
apt-get install -y openssh-server
apt-get install -y libglade2.0
#lib glade for domain join gui
cd /RV/inst/
MACADDR=$(ifconfig eth0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')
#could also be cat /sys/class/net/eth0/address
echo $MACADDR > /RV/inst/mac.txt
cd /RV/inst/APSinstall/
wget http://download.beyondtrust.com/PBISO/8.2/linux.deb.i386/pbis-open-8.2.0.2969.linux.x86.deb.sh
chmod +x $(ls | grep pbis)
chmod 755 /RV/inst/APSlinux/d2.sh
mkdir -p /home/bak/Desktop/
cp -r /etc/skel/ /home/bak
cp /RV/inst/APSinstall/domainLink.sh /home/bak/Desktop/
chmod +x /home/bak/Desktop/domainLink.sh
chown -R bak:bak /home/bak

printf "[SeatDefaults]\nallow-guest=false\n" > /usr/share/lightdm/lightdm.conf.d/50-no-guest.conf

sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
apt-get update
apt-get install -y google-chrome-stable

apt-get install -y unattended-upgrades
cp /RV/inst/APSinstall/10periodic /etc/apt/apt.conf.d/
cp /RV/inst/APSinstall/50unattended-upgrades /etc/apt/apt.conf.d/
