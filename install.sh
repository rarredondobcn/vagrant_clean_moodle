#!/bin/bash
#Instalador de bloques de moodle

while :
do
    #Menu
    clear
    echo "\e[1;32m"
    echo " --- BLOQUES V.1 ---"
    echo "1. Crear cron de Moodle"
    echo "2. Instalar theme_bcn"
    echo "3. Instalar local_pages"
    echo "4. Instalar block_bcn_organizations"
    echo "5. Instalar bcn_filemanager"
    echo "6. Instalar block_bcn_news"
    echo "7. Salir"


    #Escoger opcion
    read -p "Escoge una opcion: " opcion

    #Selección de opción
    case $opcion in
    1) echo "Creando cron de moodle"
        crontab -l > moodle
        echo "* * * * * /usr/bin/php /var/www/html/moodle/admin/cli/cron.php" >> moodlecron
        crontab moodlecron
        rm moodlecron
        echo "Cron creado"
        read foo
        ;;

    2) echo "Instalando theme_bcn"
        cd /var/www/html/moodle/theme
        git clone https://github.com/bcnschool/theme_bcn bcn
        cd /vagrant
        echo "theme_bcn instalado"
        read foo
        ;;
    3) echo "Instalando local_pages"
        cd /var/www/html/moodle/local
        git clone https://github.com/bcnschool/local_pages pages
        cd /vagrant
        echo "local_pages instalado"
        read foo
        ;;
    4) echo "Instalando bcn_organizations"
        cd /var/www/html/moodle/blocks
        git clone https://github.com/bcnschool/block_bcn_organizations bcn_organizations
        cd /vagrant
        echo "bcn_organizations instalado"
        read foo
        ;;
    5) echo "Instalando bcn_filemanager"
        cd /var/www/html/moodle/blocks
        git clone https://github.com/bcnschool/bcn_filemanager
        cd /vagrant
        echo "bcn_filemanager instalado"
        read foo
        ;;
    6) echo "Instalando bcn_news"
        cd /var/www/html/moodle/blocks
        git clone https://github.com/bcnschool/block_bcn_news bcn_news
        cd /vagrant
        echo "bcn_news instalado"
        read foo
        ;;
    7) echo "Saliendo..."
        sleep 1
        exit 0;;
    *) echo "Opción inválida..."
        sleep 0.5
    esac
done
