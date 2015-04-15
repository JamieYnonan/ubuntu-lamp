#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Entorno Desarrollo PHP MySQL v 0.1
# Ubuntu 14.04 LTS
# 
# @author       Jamie Ynoñan <jamiea31@gmail.com>
# @link         https://github.com/JamieYnonan


function inicio() {
    echo -n " ¿Desea iniciar? (s)i|(c)ancelar: "; read resp
    if [ "$resp" == "s" ]; then
        actualizar_ubuntu
        instalar_extras
        instalar_zip_rar
        instalar_entorno_php
        instalar_composer
        instalar_java
        echo " "
        echo -n " Fin! "
        echo " "
        exit;
    else
        echo -n " Instalación cacnelada! "
        echo " "
        exit;
    fi
}

function actualizar_ubuntu() {
    echo " "
    echo -n " 1. Actualizando Ubuntu "
    sudo apt-get update
    sudo apt-get upgrade -y
    echo " "
    echo -n " Actualizado!"
}

function instalar_extras() {
    echo " "
    echo -n " 2. Instalando extras restringidos "
    sudo apt-get install ubuntu-restricted-extras -y
    echo " "
    echo -n "Instalado!"
}

function instalar_zip_rar() {
    echo " "
    echo -n " 3. Instalando programas para zip y rar "
    sudo apt-get install p7zip-full p7zip-rar rar unrar -y
    echo " "
    echo -n " Instalado! "
}

function instalar_entorno_php() {
    echo " "
    echo -n " 4. Instalando apache php mysql "
    sudo apt-get curl -y
    sudo apt-get install apache2 -y
    sudo apt-get install php5 libapache2-mod-php5 -y
    sudo service apache2 restart
    echo " "
    echo -n " Ingresar el nombre del usuario (ubuntu): "; read usuario
    sudo chown -R $usuario:www-data /var/www/html
    sudo chmod -R 755 /var/www/html
    sudo apt-get install mysql-server mysql-client -y
    sudo apt-get install php5-mysql php5-curl php5-gd php-pear php5-imagick php5-mcrypt php5-memcache php5-sqlite -y
    sudo service apache2 restart
    a2enmod rewrite
    service apache2 restart
    echo " "
    echo -n " Instalado! "
}

function instalar_composer() {
    echo " "
    echo -n " 4. Instalando apache php mysql "
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
    echo " "
    echo -n " Instalado! "
}

function instalar_java() {
    echo " "
    echo -n " 4. Instalando apache php mysql "
    sudo apt-get install icedtea-7-plugin openjdk-7-jre -y
    sudo apt-get install openjdk-7-jdk -y
    echo " "
    echo -n " Instalado!" 
}

inicio