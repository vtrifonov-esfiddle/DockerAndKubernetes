FROM microsoft/dotnet:2.2-sdk

RUN apt-get -qq update && apt-get -qqy --no-install-recommends install wget gnupg \
    git \
    unzip

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app
COPY . /app

RUN npm install
RUN dotnet restore
RUN dotnet build
ENTRYPOINT [ "dotnet", "watch", "run" ]