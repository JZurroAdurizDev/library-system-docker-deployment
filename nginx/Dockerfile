FROM nginx:stable-alpine

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./library-api /etc/nginx/conf.d/library-api.conf

RUN mkdir -p /etc/nginx/ssl

COPY ./server.crt /etc/nginx/ssl/server.crt
COPY ./server.key /etc/nginx/ssl/server.key

RUN rm -f /etc/nginx/conf.d/default.conf

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]