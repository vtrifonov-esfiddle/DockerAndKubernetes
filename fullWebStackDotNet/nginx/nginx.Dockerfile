FROM nginx:stable

# replace default nginx config with nginx.conf
RUN rm /etc/nginx/conf.d/*
COPY nginx.conf /etc/nginx/conf.d