xhost +local:root
gksu sh -c 'echo -e "yes\nyes\n" | bash $(ls | grep pbis); zenity --error --text="Remember to change the line \'session sufficient    pam_lsass.so\' and change \'sufficient\' to \'[success=ok default=ignore]\' Ready?";gedit /etc/pam.d/common-session'
