 if not exists (select * from master.dbo.syslogins where name = 'DragonNest') 
 begin 
  exec sp_addlogin 'DragonNest', 'E6h7HsRXJbH8ays'  
 end  

if not exists (select * from sysusers where name = 'DragonNest') 
 begin 
  exec sp_adduser 'DragonNest', 'DragonNest'
 end 

 if not exists (select * from master.dbo.syslogins where name = 'SPExecutor') 
 begin 
  exec sp_addlogin 'SPExecutor', 'E6h7HsRXJbH8ays'  
 end  

if not exists (select * from sysusers where name = 'SPExecutor') 
 begin 
  exec sp_adduser 'SPExecutor', 'SPExecutor'
 end 


use DNMembership;
EXEC sp_change_users_login 'UPDATE_ONE','DragonNest', 'DragonNest';
EXEC sp_change_users_login 'UPDATE_ONE','SPExecutor','SPExecutor';

use DNWorld;
EXEC sp_change_users_login 'UPDATE_ONE','DragonNest', 'DragonNest';
EXEC sp_change_users_login 'UPDATE_ONE','SPExecutor','SPExecutor';