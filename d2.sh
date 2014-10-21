#!/bin/bash
cd /RV/inst/APSinstall/
echo -e "yes\nyes\n" | bash $(ls | grep pbis)
/opt/pbis/bin/domainjoin-gui
cp /RV/inst/APSinstall/common-session /etc/pam.d/'
