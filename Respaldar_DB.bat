@ECHO OFF
ECHO Respaldando Base de Datos
docker exec programapresupuestos_db_1 pg_dump -U postgres app > db/backups/db.sql
ECHO Listo!
PAUSE
