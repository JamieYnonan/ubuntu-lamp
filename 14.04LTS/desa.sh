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
    sudo apt-get install php5 libapache2-mod-php5 -y
    sudo service apache2 restart
    echo " "
    sudo chown -R $USER:www-data /var/www/html
    sudo chmod -R 755 /var/www/html
    sudo apt-get install mysql-server mysql-client -y
    sudo apt-get install php5-mysql php5-curl php5-gd php-pear php5-imagick php5-mcrypt php5-memcache php5-sqlite php5-intl -y
    sudo service apache2 restart
    sudo a2enmod rewrite
    sudo service apache2 restart
    echo " "
    echo -n " Instalado! "
}

function instalar_java() {
    echo -n " 7. Instalando java (jdk7, jre7, y icedtea7) "
    sudo apt-get install icedtea-7-plugin openjdk-7-jre -y
    sudo apt-get install openjdk-7-jdk -y
    echo " "
    echo -n " Instalado!"
}

function nspleep_e() {
	echo " "
	sleep 2
}

instalar_faltante