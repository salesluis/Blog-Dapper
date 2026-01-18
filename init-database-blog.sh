#!/bin/bash
set -e

echo "Aguardando SQL Server..."

until /opt/mssql-tools/bin/sqlcmd \
  -S sqlserver \
  -U sa \
  -P '1q2w3e4r@#$' \
  -Q "SELECT 1" > /dev/null 2>&1
do
  sleep 5
done

echo "SQL Server pronto. Executando script SQL..."

ls -l /tmp

/opt/mssql-tools/bin/sqlcmd \
  -S sqlserver \
  -U sa \
  -P '1q2w3e4r@#$' \
  -d master \
  -i /tmp/Create_Database.sql
  
/opt/mssql-tools/bin/sqlcmd \
  -S sqlserver \
  -U sa \
  -P '1q2w3e4r@#$' \
  -d master \
  -i /tmp/Seed_Blog_Database.sql

echo "---------------------------------------------------"
echo "       BANCO CRIADO A POPULADO COM SUCESSO"
echo "---------------------------------------------------"
