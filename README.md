# Moodle limpio | Vagrant
![Logo](/img/bcn.png)

Vagrant es una herramienta que permite la creación de entornos de desarrollo virtualizados que pueden ser reproducidos y compartidos de una forma muy sencilla.

## Contenido
Este [Vagrant](https://developer.hashicorp.com/vagrant) contiene lo siguiente:
- [Debian 10 Buster](https://www.debian.org/releases/buster/index.es.html)
- [Moodle 3.11](https://github.com/moodle/moodle.git)
- [Php 7.3](https://www.php.net/releases/7_3_0.php)
- [Mariadb](https://mariadb.org/)
- [Git](https://git-scm.com/)

## Configuraciones realizadas
Este vagrant está configurado para corer sobre la url [moodle.test](http://moodle.test) que previamente hay que configurar dentro de nuestro archivo hosts apuntando al 192.168.0.10.

Puede ser utilizado con cualquier herramienta de diseño de base de datos como workbench o navicat, conectándose con el host 192.168.0.10 user: moodle, password moodle con el puerto 3306.

Tiene instalado git, dentro de la máquina para poder descargar cualquier repo desde dentro sin necesidad de instalarlo por fuera.

Configurada con hora de Santiago de Chile dentro del server.

## Correr en local
Instalar [VirtualBox 6.0 - 6.1](https://www.virtualbox.org/wiki/Download_Old_Builds_6_1)

Instalar [Vagrant](https://developer.hashicorp.com/vagrant/downloads)

Clonar el proyecto

```bash
  git clone https://github.com/moodle/moodle.git
```

Ir a la carpeta del directorio

```bash
  vagrant up
```

## Instalar en local
Al usar el comando
```bash
  vagrant up
```
se ejecuta el script de instalación, el cual instala los paquetes necesarios para correr moodle, crea la base de datos moodle, crea el usuario moodle y le asigna los permisos necesarios para correr moodle.

![vagrant up](/img/install.png)

Cuando terminemos de Instalar vagrant, se accede a moodle a través de la direción 192.168.0.10, o si previamente hemos configurado nuestro archivo hosts a la ip antes mencionada podemos acceder desde moodle.test

![Vagrant instalado](/img/ifinish.png)

El nombre de la base de datos por default es moodle, el usuario moodle y la contraseña moodle. Estos datos se pueden cambiar en el script de instalación en el archivo [script.sh](script.sh)

![Vagrant base da datos](/img/cdb.png)

Con estos pasos ya tenemos instalado moodle en nuestra máquina local.

![Vagrant moodle](/img/moodle.png)

Para instalar el tema de moodle, bloques y plugins se ha creado un script al cual accedemos entrando directo a la máquina virtual con el comando
```bash
  vagrant ssh
```
![Vagrant ssh](/img/ssh.png)

Una vez dentro de la máquina virtual, nos dirigimos a la carpeta vagrant y ejecutamos el script de instalación de plugins, bloques y temas
```bash
  cd /vagrant
  sudo sh install.sh
```
![Vagrant install](/img/installsh.png)

Para instalar un plugin, tema o bloque solo hay que seleccionar la opción correspondiente y presionar enter.

## Comandos útiles
```bash
  vagrant up
```
Acceder por ssh
```bash
  vagrant up
```
Apagar entorno
```bash
  vagrant halt
```
Borrar entorno de el disco virtual
```bash
  vagrant destroy
```
Reiniciar entorno al estado inicial y correr el script de arranque
```bash
  vagrant reload
```
Ejecuta el script si se actualizó, ejecutar si hay cambios
```bash
  vagrant reload
```

Al terminar de Instalar el script, se accede a moodle a través de la direción 192.168.0.10, o si previamente hemos configurado nuestro archivo hosts a la ip antes mencionada podemos acceder desde moodle.test

## Documentación de Vagrant

[Documentación](https://developer.hashicorp.com/vagrant/docs)

Otras recetas de [Vagrant](https://app.vagrantup.com/boxes/search)


## Authors

- [@rarredondobcn](https://github.com/rarredondobcn)
- [@ricardo77a](https://github.com/ricardo77a)
