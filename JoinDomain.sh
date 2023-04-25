#!/bin/bash
# This script joins a Debian system to an Active Directory Domain in order to enable authentication
# It also installs all required dependencies to do so

if [[ $EUID > 0 ]]; then  
	echo "This script must be run as root/sudo"
	exit 1
else
	# Read Domain
	echo "Please input full domain name (ex. domain.contoso.net):"
	read domain

	# Read Username
	echo "Username:"
	read username

	apt-get install aptitude -y
	aptitude install realmd sssd -y

	realm join $domain -U "'$username'" --install='/' --verbose

	#Allow all AD users to log in
	realm permit --realm $domain --all
fi
