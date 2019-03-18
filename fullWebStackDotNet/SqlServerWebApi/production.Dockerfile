FROM microsoft/dotnet:2.2-sdk as publish

WORKDIR /appSource
COPY . /appSource
RUN dotnet build
RUN dotnet publish -c Release -o /appPublish

FROM microsoft/dotnet:2.2-aspnetcore-runtime
WORKDIR /app
COPY --from=publish /appPublish /app

ENTRYPOINT ["dotnet", "SqlServerWebApi.dll"]