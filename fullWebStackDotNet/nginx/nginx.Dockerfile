FROM nginx:stable
ARG nginx_env=prod
# replace default nginx config with nginx.conf
RUN rm /etc/nginx/conf.d/*
COPY nginx.${nginx_env}.conf /etc/nginx/conf.d