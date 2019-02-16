FROM microsoft/dotnet:2.2-sdk

WORKDIR /app
COPY . .
RUN dotnet restore
RUN dotnet build
ENTRYPOINT [ "dotnet", "watch", "run" ]