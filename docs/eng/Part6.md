# Part 6. Basic Docker Compose

> Russian version: [Part6_ru.md](../ru/Part6_ru.md)

## 6.1. Preparing the Docker Compose Configuration

Create a `docker-compose.yml` file that starts two containers:

1. the application from [Part 5](Part5.md);
2. an Nginx container acting as a reverse proxy.

Port `8080` of the Nginx container is published on port `80` of the host machine.

![docker-compose.yml](../../images/part6/1.png)

> Final version of the `docker-compose.yml` file: [src/final/compose/docker-compose.yml](../../src/final/compose/docker-compose.yml)

> Version of the `docker-compose.yml` file used during the lab work: [src/history/Part6/docker-compose.yml](../../src/history/Part6/docker-compose.yml)

A separate `Dockerfile` was also created for this part.

![Dockerfile](../../images/part6/2.png)

> Dockerfile used in this part: [src/history/Part6/Dockerfile](../../src/history/Part6/Dockerfile)

The Nginx configuration forwards requests to the application container.

![nginx.conf](../../images/part6/3.png)

> Configuration file used in this part: [src/final/compose/nginx.conf](../../src/final/compose/nginx.conf)

---

## 6.2. Preparing the Environment

Before starting the project, remove any previously created containers.

```bash
docker rm $(docker ps -a -q)
```

![docker rm](../../images/part6/4.png)

---

## 6.3. Building and Starting the Project

Build and start the services using Docker Compose:

```bash
docker compose build
docker compose up -d
```

![docker-compose](../../images/part6/5.png)

After startup, two containers are created:

* `hello_server` — the FastCGI application;
* `hello_nginx` — the Nginx reverse proxy.

---

## 6.4. Verifying the Application

Open the following URLs in a browser:

```text
http://localhost:80
```

```text
http://localhost/status
```

or use:

```bash
curl localhost:80
curl localhost/status
```

![docker-compose](../../images/part6/6.png)

---

## Summary

A two-container application consisting of a FastCGI server and an Nginx reverse proxy was deployed using `Docker Compose`. Communication between containers and service publishing to the host machine were configured.

---

## Navigation

↑ [README](../../README.md)

← [Part 5. Dockle](Part4.md)

---