FROM microsoft/dotnet:2.2-sdk

WORKDIR /app
COPY . .
RUN dotnet restore

ENTRYPOINT [ "dotnet", "watch", "run" ]