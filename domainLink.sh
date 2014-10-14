xhost +local:root
gksu sh -c 'echo -e "yes\nyes\n" | bash $(ls | grep pbis); cp /RV/inst/common-session /etc/pam.d/'
