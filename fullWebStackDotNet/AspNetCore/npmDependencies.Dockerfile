FROM node:10 as nodejs
ARG buildenv

WORKDIR /app
COPY . /app
RUN echo "Build environment: $buildenv"
RUN npm install
RUN node ./node_modules/webpack/bin/webpack.js --config webpack.config.vendor.js $buildenv
RUN node ./node_modules/webpack/bin/webpack.js $buildenv