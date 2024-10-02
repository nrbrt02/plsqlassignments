--create user
CREATE USER C##no_plsqlauca IDENTIFIED BY auca;
GRANT ALL PRIVILEGES TO C##no_plsqlauca;

--create pdb
SHOW con_name;
ALTER SESSION SET container = CDB$ROOT;
CREATE PLUGGABLE DATABASE no_to_delete_pdb
ADMIN USER no_plsqlauca IDENTIFIED BY auca
FILE_NAME_CONVERT = ('C:\App\oradata\ORCL\pdbseed\', 'C:\App\db_home\oradata\no_to_delete_pdb\');

--after creation this is how you connecto to pdb
ALTER SESSION SET CONTAINER = CDB$ROOT;
CONNECT SYS/r00t AS SYSDBA;
ALTER PLUGGABLE DATABASE no_to_delete_pdb OPEN;
ALTER SESSION SET CONTAINER = no_to_delete_pdb;
ALTER SESSION SET CONTAINER = no_to_delete_pdb;

----delete pdb
CONNECT SYS/r00t AS SYSDBA;
ALTER SESSION SET CONTAINER = CDB$ROOT;
ALTER PLUGGABLE DATABASE no_to_delete_pdb CLOSE IMMEDIATE;
DROP PLUGGABLE DATABASE no_to_delete_pdb INCLUDING DATAFILES;
SELECT con_id, name, open_mode FROM v$containers;




