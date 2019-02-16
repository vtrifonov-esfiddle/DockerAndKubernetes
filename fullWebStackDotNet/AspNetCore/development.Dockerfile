FROM microsoft/dotnet:2.2-sdk

RUN apt-get -qq update && apt-get -qqy --no-install-recommends install wget gnupg \
    git \
    unzip

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs \
    procps
# enable remote debugging with Visual Studio Code for .NET core apps: 
# https://github.com/OmniSharp/omnisharp-vscode/wiki/Attaching-to-remote-processes#configuring-docker-attach-with-launchjson
# "Attach to Docker Container AspNetCore (.NET)" launch profile
RUN curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l /root/vsdbg
WORKDIR /app
COPY . /app

RUN npm install
RUN dotnet restore
RUN dotnet build
ENTRYPOINT [ "dotnet", "watch", "run" ]