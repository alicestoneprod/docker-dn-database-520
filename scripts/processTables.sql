RESTORE DATABASE [DNWorld]
FROM DISK = '/var/opt/mssql/Backups/DNWorld.bak'
WITH 
    MOVE 'DNWorld' TO '/var/opt/mssql/data/DNWorld64.mdf',
    MOVE 'DNWorld_Data1' TO '/var/opt/mssql/data/DNWorld64_Data1.ndf',
    MOVE 'DNWorld_Index1' TO '/var/opt/mssql/data/DNWorld64_Index1.ndf',
    MOVE 'DNWorld_log' TO '/var/opt/mssql/data/DNWorld64_log.ldf',
    RECOVERY;


RESTORE DATABASE [DNMembership]
FROM DISK = '/var/opt/mssql/Backups/DNMembership.bak'
WITH 
    MOVE 'DNMembership' TO '/var/opt/mssql/data/DNMembership64.mdf',
    MOVE 'DNMembership_Data1' TO '/var/opt/mssql/data/DNMembership64_Data1.ndf',
    MOVE 'DNMembership_Index1' TO '/var/opt/mssql/data/DNMembership64_Index1.ndf',
    MOVE 'DNMembership_log' TO '/var/opt/mssql/data/DNMembership64_log.ldf',
    RECOVERY;
