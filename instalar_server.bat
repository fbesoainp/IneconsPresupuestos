@ECHO OFF
ECHO Iniciando instalador
docker-compose build
ECHO Creando Base de Datos
docker-compose run web rake db:create
docker-compose run web rake db:migrate
docker-compose run web rake db:seed
ECHO Listo
PAUSE