FROM microsoft/dotnet-framework:4.7.2-sdk-windowsservercore-1803 AS build
WORKDIR /appSource

# copy csproj and restore as distinct layers
COPY *.sln .
COPY AspNet/*.csproj ./AspNet/
COPY AspNet/*.config ./AspNet/
RUN nuget restore

# copy everything else and build app
COPY AspNet/. ./AspNet/
WORKDIR /appSource/AspNet
RUN msbuild /p:Configuration=Release


FROM mcr.microsoft.com/dotnet/framework/aspnet:4.7.2-windowsservercore-1803 AS runtime
WORKDIR /inetpub/wwwroot
COPY --from=build /appSource/AspNet/. ./