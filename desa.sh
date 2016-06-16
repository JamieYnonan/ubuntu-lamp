#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Entorno Desarrollo PHP MySQL
# Ubuntu 14.04 LTS
# Ubuntu 16.04 LTS
# 
# @author       Jamie Ynoñan <jamiea31@gmail.com>
# @link         https://github.com/JamieYnonan
# @version		1.0.0 - 2016-06-15

function seleccionar_version() {
    echo -n " ¿Qué versión desea installar? "
    echo -n " 1. Ubuntu 14.04 LTS "
    echo -n " 2. Ubuntu 16.04 LTS "
    echo -n " 3. Exit "; read resp
    if [ "$resp" == 1 ]; then
        instalacion_general
        cd 14.04LTS/
        chmod +x desa.sh
        ./desa.sh
        echo -n " Fin! "
        echo " "
        exit;
    elif [ "$resp" == 2 ]; then
        instalacion_general
        cd 16.04LTS/
        chmod +x desa.sh
        ./desa.sh
        echo -n " Fin! "
        echo " "
        exit;
    elif [ "$resp" == 3 ]; then
        echo -n " Instalación cancelada! "
        echo -n " "
        exit;
    fi
}

function instalacion_general() {
    nspleep
    actualizar_ubuntu
    nspleep
    instalar_extras
    nspleep
    instalar_zip_rar
    nspleep
    instalar_phpunit
    nspleep
    instalar_composer
    nspleep
}

function actualizar_ubuntu() {
    echo -n " 1. Actualizando Ubuntu "
    sudo apt-get update
    sudo apt-get upgrade -y
    echo " "
    echo -n " Actualizado!"
}

function instalar_extras() {
    echo -n " 2. Instalando extras restringidos "
    sudo apt-get install ubuntu-restricted-extras -y
    echo " "
    echo -n "Instalado!"
}

function instalar_zip_rar() {
    echo -n " 3. Instalando programas para zip y rar "
    sudo apt-get install p7zip-full p7zip-rar rar unrar -y
    echo " "
    echo -n " Instalado! "
}

function instalar_phpunit() {
    echo -n " 4. Instalando phpunit "
    wget https://phar.phpunit.de/phpunit.phar
    chmod +x phpunit.phar
    sudo mv phpunit.phar /usr/local/bin/phpunit
}

function instalar_composer() {
    echo -n " 5. Instalando composer "
    sudo apt-get curl -y
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
    echo " "
    echo -n " Instalado! "
}

function nspleep() {
	echo " "
	sleep 2
}

seleccionar_version