FROM microsoft/mssql-server-windows-developer:2017
ENV ACCEPT_EULA=Y
COPY DB/. C:/DB
ENV attach_dbs='[{"dbName": "CounterData", "dbFiles": ["C:\\DB\\CounterData.mdf", "C:\\DB\\CounterData_log.ldf"]}]'