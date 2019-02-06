FROM microsoft/dotnet:2.2-sdk as dotnet-sdk

RUN apt-get -qq update && apt-get -qqy --no-install-recommends install wget gnupg \
    git \
    unzip
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

WORKDIR /appSource
COPY . /appSource
RUN npm install
RUN dotnet build
RUN dotnet publish -c Release -o /appPublish

FROM microsoft/dotnet:2.2-aspnetcore-runtime
WORKDIR /app
COPY --from=dotnet-sdk /appPublish /app

ENTRYPOINT ["dotnet", "AspNetCore.dll"]