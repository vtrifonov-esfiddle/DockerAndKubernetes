FROM mcr.microsoft.com/mssql/server:2017-CU8-ubuntu
ENV ACCEPT_EULA=Y
ENV MSSQL_PID=Developer

RUN mkdir -p /usr/createDb
WORKDIR /usr/createDb

COPY ./createDb /usr/createDb
RUN chmod +x /usr/createDb/createDb.sh

CMD bash ./entrypoint.sh