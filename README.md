# Moodle limpio | Vagrant
![Logo](https://www.emagister.com/assets/es/logos/centro/id/92772/size/l.jpg)

Vagrant es una herramienta que permite la creación de entornos de desarrollo virtualizados que pueden ser reproducidos y compartidos de una forma muy sencilla.

## Contenido
Este [Vagrant](https://developer.hashicorp.com/vagrant) contiene lo siguiente:
- Debian 10 Buster
- [Moodle 3.11](https://github.com/moodle/moodle.git)
- Php 7.3
- Mariadb
- Git

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

