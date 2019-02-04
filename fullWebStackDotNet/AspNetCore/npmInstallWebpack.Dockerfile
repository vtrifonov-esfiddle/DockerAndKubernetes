FROM node:10
WORKDIR /app
ENTRYPOINT npm install; node ./node_modules/webpack/bin/webpack.js --config webpack.config.vendor.js; node ./node_modules/webpack/bin/webpack.js