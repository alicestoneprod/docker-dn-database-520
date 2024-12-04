FROM rapidfort/microsoft-sql-server-2019-ib

ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD="E6h7HsRXJbH8ays"
ENV MSSQL_USER="DragonNest"
ENV MSSQL_USER_PASSWORD="E6h7HsRXJbH8ays"

VOLUME /var/opt/mssql/Backups

COPY ./db/DNWorld.bak /var/opt/mssql/Backups/DNWorld.bak
COPY ./db/DNMembership.bak /var/opt/mssql/Backups/DNMembership.bak

COPY ./scripts/processTables.sql /var/opt/mssql/scripts/processTables.sql
COPY ./scripts/processUsers.sql /var/opt/mssql/scripts/processUsers.sql


EXPOSE 1433

