FROM node:10 as nodejs

WORKDIR /app
COPY . /app
RUN npm install
RUN node ./node_modules/webpack/bin/webpack.js --config webpack.config.vendor.js
RUN node ./node_modules/webpack/bin/webpack.js

FROM microsoft/dotnet:2.2-sdk

WORKDIR /app
COPY . /app
COPY --from=nodejs /app /app
RUN dotnet restore
ENTRYPOINT ["dotnet", "run"]