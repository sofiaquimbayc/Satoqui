# Base de Datos - Proyecto Satoqui

## Este es un manual paso a paso para correr la base de datos CHOCOLATE 

## Configuración Previa

### 1. Conectarse a vagrant (máquina virtual previamente descargada con su pathway conocido)
```bash
Cd ubuntu --dependiendo la ubicación de la máquina virtual
vagrant up
vagrant ssh
```
### 2. Crear la base de datos 
```bash
CREATEDB CHOCOLATE
```
### 3. Conectar a la base de datos 
```bash
psql CHOCOLATE
```
### 4. Descargar los archivos .csv que contiene información para insertar en la base de datos, y guardarlos en la misma dirección de la máquina virtual. 
### 5. Copiar y pegar los comandos que se encuentran en el archivo COMANDOS_SQL_MAKEFILE.sql.
### 6. Copiar los comandos en orden y uno por uno para prevenir errores.
