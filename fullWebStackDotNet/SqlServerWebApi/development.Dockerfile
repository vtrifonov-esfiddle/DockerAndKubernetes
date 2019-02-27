FROM microsoft/dotnet:2.2-sdk

# enable remote debugging with Visual Studio Code for .NET core apps: 
# https://github.com/OmniSharp/omnisharp-vscode/wiki/Attaching-to-remote-processes#configuring-docker-attach-with-launchjson
# "Attach to Docker Container AspNetCore (.NET)" launch profile
RUN apt-get -qq update && apt-get install -y unzip \
    procps
RUN curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l /root/vsdbg

WORKDIR /app
COPY . .
RUN dotnet restore
RUN dotnet build
ENTRYPOINT [ "dotnet", "watch", "run" ]