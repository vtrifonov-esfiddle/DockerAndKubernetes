FROM microsoft/dotnet:2.2-sdk

WORKDIR /app
COPY . /app
RUN dotnet restore
RUN dotnet build
ENTRYPOINT ["dotnet", "run"]