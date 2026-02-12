FROM nginx:alpine

COPY myapp/index.html /usr/share/nginx/html/index.html

EXPOSE 80
