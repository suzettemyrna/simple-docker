FROM nginx:latest

WORKDIR /home/

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./run.sh .
COPY ./hello.c .

USER root

RUN apt-get update && \
    apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m hello_user && \
    chown -R hello_user:hello_user /etc/nginx/nginx.conf /var/cache/nginx /home && \
    touch /var/run/nginx.pid && \
    chown -R hello_user:hello_user /var/run/nginx.pid && \
    chmod u-s /usr/bin/gpasswd /usr/bin/chsh /usr/bin/chfn /usr/bin/expiry /usr/bin/passwd /sbin/unix_chkpwd /usr/bin/chage /usr/bin/wall /bin/umount /bin/mount /usr/bin/newgrp /bin/su

USER hello_user

HEALTHCHECK CMD curl --fail http://localhost:81/ || exit 1

ENTRYPOINT ["bash", "./run.sh"]