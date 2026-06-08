FROM nginx:latest

WORKDIR /home/

RUN apt update && apt upgrade -y && apt install -y libfcgi-dev spawn-fcgi gcc

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./hello.c .
COPY ./run.sh .

ENTRYPOINT ["bash", "/home/run.sh"]