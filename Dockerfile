FROM nginx

RUN set -eu ; \
    mkdir  /usr/share/nginx/html/login && apt update && apt install nano -y && apt-get install iputils-ping -y


COPY 200.html /usr/share/nginx/html
COPY 404.html /usr/share/nginx/html
COPY ./custom_error.html /usr/share/nginx/html
COPY ./index.html /usr/share/nginx/html/login
COPY ./default.conf /etc/nginx/conf.d
