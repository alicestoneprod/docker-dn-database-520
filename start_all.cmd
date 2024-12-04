call !!!build-docker-image.cmd
call !!!create-volume.cmd
call !!start-docker-image.cmd
timeout /t 30
Echo "Await 30 second before sql server in container was successfully started"
call !start-sql-executor.cmd
