#!/bin/bash

echo "#########################"
echo "## Systeminformations  ##"
echo ""
echo "   Time: " `date`
echo ""
echo "#########################"

echo "Start Script?"
echo "Y/n"
read ANS
if [ "$ANS" == "Y" ]
    then
        echo "Starting"
        echo "Searching Apache2"
    else
        echo "Exit"
	exit
fi

PRGPATH=`which apache2 2>/dev/null`

[ $? -eq 1 ] && {
	echo "Apache2 is not installed"
	echo "install... Please Wait"
	sudo apt install apache2
}
	echo "Apache is installed, skip"
	
PRGPATH=`which php7.3 2>/dev/null`

[ $? -eq 1 ] && {
	echo "PHP7.3 is not installed"
	echo "install... Please Wait"
	sudo apt -y install lsb-release apt-transport-https ca-certificates
	sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
	echo “deb https://packages.sury.org/php/ $(lsb_release -sc) main” | sudo tee /etc/apt/sources.list.d/php7.3.list
	sudo apt update
	sudo apt-get -y install php7.3
	apt-get install libapache2-mod-php7.3
}
	echo "PHP7.3 is installed, skip"
	
echo "Install PHP Extensions?"
echo "Y/n"
read ANS
if [ "$ANS" == "Y" ]
    then
        echo "Starting"
		sudo apt-get install php7.3-cli php7.3-fpm php7.3-json php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath php7.3-json
    else
        echo "Next"
	exit
fi

echo "Finish :)"
echo "Now open the Url http://127.0.0.1/"
