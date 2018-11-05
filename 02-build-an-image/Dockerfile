FROM nginx:1.15

COPY nginx.conf /etc/nginx/nginx.conf

COPY www /data/www

CMD ["nginx", "-g", "daemon off;"]
