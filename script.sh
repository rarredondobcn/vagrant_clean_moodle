#!/usr/bin/env bash

######################################################################
## MOODLE LIMPIO
## RICARDO ARREDONDO RÍOS
######################################################################

echo -e "\n\n\n\n ======================="
echo -e " Actualizando el server."
echo -e "=========================\n\n\n\n"
sleep 5s
sudo apt-get -y update

echo -e "\n\n\n\n ========================"
echo -e " Instalando certificados."
echo -e "=========================\n\n\n\n"
sleep 5s

sudo apt-get -y install apt-transport-https lsb-release ca-certificates curl
sudo apt-get -y install software-properties-common dirmngr
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sudo sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
sleep 5s

echo -e "\n\n\n\n ============="
echo -e " Actualizando."
echo -e "==============\n\n\n\n"
sleep 5s
sudo apt-get -y update

echo -e "\n\n\n\n ============"
echo -e " Upgradeando."
echo -e "=============\n\n\n\n"
sleep 5s
sudo apt-get -y upgrade


echo -e "\n\n\n\n =================="
echo -e " Instalando Apache."
echo -e "===================\n\n\n\n"
sleep 5s
sudo apt-get -y install apache2
sudo systemctl enable apache2
sudo systemctl start apache2

echo -e "\n\n\n\n ====================================================="
echo -e " Instalando Mariadb y configurando root como password."
echo -e "=======================================================\n\n\n\n"
sleep 5s


sudo apt-get -y install mariadb-server
sudo systemctl enable mariadb
sudo systemctl start mariadb


echo -e "\n\n\n\n ========================================================================"
echo -e " Actualizando configuración de mariadb para hacer accesible via via root."
echo -e "\ ESTO SOLO ES EN DESARROLLO!!!!!!!!!!!"
echo -e "=========================================================================\n\n\n\n"
sleep 5s

#Se permite la conexión a mariadb
#sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/mysqld.cnf
sudo sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

ROOT_DB_PASSWORD="root"
#SQL="GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"
#sudo mysql -u root -p${ROOT_DB_PASSWORD} -e "${SQL}"
CREATE="CREATE USER 'moodle'@'%' IDENTIFIED BY 'moodle'; "
GRANT="GRANT ALL PRIVILEGES ON *.* TO 'moodle'@'%' IDENTIFIED BY 'moodle'; "
FLUSH="FLUSH PRIVILEGES;"
CREATEDB="CREATE DATABASE moodle character set utf8mb4 collate utf8mb4_unicode_ci;"

sudo mysql -u root -p${ROOT_DB_PASSWORD} -e "${CREATE}"
sudo mysql -u root -p${ROOT_DB_PASSWORD} -e "${GRANT}"
sudo mysql -u root -p${ROOT_DB_PASSWORD} -e "${FLUSH}"
sudo mysql -u root -p${ROOT_DB_PASSWORD} -e "${CREATEDB}"

## Modifica la zona horaria si es necesario
echo -e "\n\n\n\n ============================================"
echo -e "Configurar la zona horaria del server."
echo -e "Cambiando Zona horaria a 'America/Santiago'. "
echo -e "============================================\n\n\n\n"
sleep 5s
sudo timedatectl set-timezone America/Santiago
# Instala ntp para mantener la zona horaria sincronizada
sudo apt-get install -y ntp
sleep 5s


echo -e "\n\n\n\n ======================"
echo -e " Reiniciando servicios. "
echo -e "========================\n\n\n\n"
sleep 5s
sudo systemctl restart apache2
sudo systemctl restart mariadb



echo -e "\n\n\n\n ==============="
echo -e " Instalando Php."
echo -e "================\n\n\n\n"
sleep 5s
sudo apt-get -y install php7.3
sudo apt-get install -y php-pear
sudo apt-get install -y php7.3-curl
sudo apt-get install -y php7.3-dev
sudo apt-get install -y php7.3-gd
sudo apt-get install -y php7.3-mbstring
sudo apt-get install -y php7.3-zip
sudo apt-get install -y php7.3-mysql
sudo apt-get install -y php7.3-xml
sudo apt-get install -y php7.3-cli
sudo apt-get install -y php7.3-imagick
sudo apt-get install -y php7.3-gmp
sudo apt-get install -y php7.3-mcrypt
sudo apt-get install -y php7.3-odbc
sudo apt-get install -y php7.3-pgsql
sudo apt-get install -y php7.3-xsl
sudo apt-get install -y php7.3-bcmath
sudo apt-get install -y php-zip
sudo apt-get install -y unzip
sudo apt-get install -y openssl
sudo apt-get install -y php7.3-gd
sudo apt-get install -y php7.3-intl
sudo apt-get install -y php7.3-xmlrpc
sudo apt-get install -y php7.3-soap

sudo apt-get -y install libapache2-mod-php7.3
sudo a2enmod php7.3
sudo a2enmod rewrite
sudo systemctl restart apache2

echo -e "\n\n\n\n ======================"
echo -e " Instalando Git."
echo -e "========================\n\n\n\n"
sleep 5s
sudo apt-get -y install git

echo -e "\n\n\n\n ==============="
echo -e "Configuraciones de php.ini"
echo -e "================\n\n\n\n"
sleep 5s

sudo sed -i -e 's/;max_input_vars = 1000/max_input_vars = 5000/' /etc/php/7.3/apache2/php.ini
sudo sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 20M/' /etc/php/7.3/apache2/php.ini
sudo sed -i -e 's/post_max_size = 8M/post_max_size = 30M/' /etc/php/7.3/apache2/php.ini
#;max_input_vars = 1000


echo -e "\n\n\n\n ==============="
echo -e " Instalando Moodle y creando virtualhost."
echo -e "================\n\n\n\n"
sleep 5s
cd /var/www/html/
git clone -b MOODLE_311_STABLE https://github.com/moodle/moodle.git
sudo mkdir /var/www/html/moodledata
sudo chown -R www-data: /var/www/html/moodle/ /var/www/html/moodledata/
sudo touch /etc/apache2/sites-available/moodle.test.conf
sudo cp /vagrant/moodle.test.conf /etc/apache2/sites-available/moodle.test.conf
sudo ln -s /etc/apache2/sites-available/moodle.test.conf /etc/apache2/sites-enabled/moodle.test.conf

sudo systemctl restart apache2

sudo a2dissite 000-default
sudo a2ensite moodle.test.conf
sudo systemctl reload apache2

#Necesaria esta librería para la biblioteca
sudo apt-get install ffmpeg

#ver procesos y memoria
sudo apt-get install htop
