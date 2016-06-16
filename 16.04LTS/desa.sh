#!/bin/bash
# -*- ENCODING: UTF-8 -*-

function instalar_faltante() {
    instalar_entorno_php
    nspleep_e
    instalar_java
    nspleep_e
}

function instalar_entorno_php() {
    echo -n " 6. Instalando apache php mysql "
    sudo apt-get install apache2 -y
    sudo apt-get install php7.0 libapache2-mod-php7.0 -y
    sudo service apache2 restart
    echo " "
    sudo chown -R $USER:www-data /var/www/html
    sudo chmod -R 755 /var/www/html
    sudo apt-get install mysql-server mysql-client -y
    sudo apt-get install php7.0-mysql php7.0-curl php7.0-gd php-pear php-imagick php7.0-imap php7.0-mcrypt php-memcache php7.0-xmlrpc php7.0-mbstring php7.0-sqlite3 php7.0-json php7.0-intl -y
    sudo service apache2 restart
    sudo a2enmod rewrite
    sudo service apache2 restart
    echo " "
    echo -n " Instalado! "
}

function instalar_java() {
    echo -n " 7. Instalando java (openjdk8, openjre8, y icedtea8) "
    sudo apt-get install icedtea-8-plugin openjdk-8-jre -y
    sudo apt-get install openjdk-8-jdk -y
    echo " "
    echo -n " Instalado!"
}

function nspleep_e() {
	echo " "
	sleep 2
}

instalar_faltante