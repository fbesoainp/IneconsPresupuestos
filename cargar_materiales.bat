@ECHO OFF
ECHO Iniciando...
docker-compose run web rake db:seed
PAUSE