#!/bin/bash
# This script joins a Debian system to an Active Directory Domain in order to enable authentication
# It also installs all required dependencies to do so
newline='
'

if [[ $EUID > 0 ]]; then  
	echo "ERROR: This script must be run with sudo..."
	exit 1
else
	echo "This script joins a Debian system to an Active Directory Domain in order to enable authentication"; echo $newline
	# Read domain
	echo -n "Please input full domain name (ex. domain.contoso.net):"; read domain; echo $newline
	# Read username
	echo -n "Username to use in order to join the domain:"; read username; echo $newline
	# Read object to allow
	echo -n "Which user or group will be allowed login access to the server? (ex. DOMAIN\username or DOMAIN\groupname):"; read allowedObject; echo $newline
	
	#install all required deps for a typical AD join
	dpkg --verify realmd || apt-get install realmd -y
	dpkg --verify sssd || apt-get install sssd -y
	dpkg --verify sssd-tools || apt-get install sssd-tools -y
	dpkg --verify libnss-sss || apt-get install libnss-sss -y
	dpkg --verify libpam-sss || apt-get install libpam-sss -y
	dpkg --verify adcli || apt-get install adcli -y
	dpkg --verify samba-common-bin || apt-get install samba-common-bin -y
	
	
	echo "All required dependencies are installed!"
	echo "Joining domain now..."; echo $newline
	
	#join domain
	realm join $domain -U "'$username'" --install='/' --verbose

	#Allow all AD users to log in
	realm permit --realm $domain "'$allowedObject'"
	
	
fi
