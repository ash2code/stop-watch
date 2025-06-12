#sample dockerfile
FROM ubuntu
RUN  apt-get update -y && apt install nginx -y
RUN rm -rf /var/www/html/*.html
COPY . /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
