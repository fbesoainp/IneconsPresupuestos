# IneconsPresupuestos
Programa de presupuestos para inecons

## Instalacion

1. Ejecutar app docker desktop (esperar a que termine de inicializarse)

2. Ejecutar archivo:
```
instalar_server.bat
```
O ejecutar los siguientes comandos:
```
docker-compose build
docker-compose run web rake db:create
docker-compose run web rake db:migrate
docker-compose run web rake db:seed
```
3. Ejecutar archivo:
```
server.bat
```
O ejecutar el siguiente comando:
```
docker-compose up
```

## Cargar materiales
El archivo desde el cual se cargan los materiales, se encunetra en la ruta:
```
/db/data/materiales.csv
```
Agregar los materiales a ese archivo y luego ejecutar el archivo: 

```
cargar_materiales.bat
```
O ejecutar en la carpeta el comando:
```
docker-compose run web rake db:seed
```
Importante: El archivo tiene que estar en formato csv delimitado por comas.

## Ruby on rails & PostgreSQL
### Instrucciones
- docker-compose build
- docker-compose run web rake db:create
- docker-compose run web rake db:migrate
- docker-compose run web rake db:seed
- docker-compose up

### Revisión de base de datos
- docker ps
- docker exec -it YOUR_PSQL_CONTAINER_ID bash
- psql app postgres


## Rake commands
### Create or drop database
- docker-compose run web rake db:drop (db:create)

