Param (
    [Parameter(Mandatory=$true)]
    [string] $password
)
docker exec -it sql_server_experimental /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $password