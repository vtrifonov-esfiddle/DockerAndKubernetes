#make sure LF line endings are used
#wait for the SQL Server to come up
function waitUntilServerIsUp() {
    while :
    do
        sleep 5
        /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P ${SA_PASSWORD} -Q "SELECT @@VERSION" -b
        isServerUp=$?
        if [ $isServerUp -eq 0 ]
        then    
            break
        else
            echo "Server is down"
        fi
    done
}

#run the setup script to create the DB and the schema in the DB
function runCreateDbScript() {
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P ${SA_PASSWORD} -d master -i CreateDb.sql
}


waitUntilServerIsUp
runCreateDbScript