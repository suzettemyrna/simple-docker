# Part 4. Custom Docker Image

> Russian version: [Part4_ru.md](../ru/Part4_ru.md)

## 4.1. Creating a Docker Image

Create an image that:

1. compiles the FastCGI application from [Part 3](Part3.md);
2. runs it on port `8080`;
3. uses a custom Nginx configuration;
4. starts Nginx inside the container.

Create a `Dockerfile`.

![Dockerfile](../../images/part4/1.png)

Main instructions:

* `FROM nginx:latest` uses the official Nginx image as the base image;
* `WORKDIR` sets the working directory;
* `RUN` installs required packages;
* `COPY` copies source files into the image;
* `ENTRYPOINT` specifies the command executed when the container starts.

> Dockerfile used in this part: [src/history/Part4/Dockerfile](../../src/history/Part4/Dockerfile)

Create a `run.sh` script to start the application.

![run.sh](../../images/part4/2.png)

The script compiles the FastCGI application, starts it on port `8080`, and then launches Nginx.

> Script source code: [src/final/run.sh](../../src/final/run.sh)

---

## 4.2. Building the Image

Build the image with the name `hello` and the tag `v1`.

```bash
docker build -t hello:v1 .
```

Verify that the image was created successfully:

```bash
docker images
```

![docker build](../../images/part4/3.png)

---

## 4.3. Running the Container

Run a container based on the created image.

```bash
docker run -d \
  -p 80:81 \
  -v ./nginx/nginx.conf:/etc/nginx/nginx.conf \
  --name hello_container \
  hello:v1
```

The `-v` option mounts the local Nginx configuration file into the container, allowing configuration changes without rebuilding the image.

![docker run](../../images/part4/4.png)

Verify that the application is running:

```bash
curl http://localhost:80
```

![localhost:80](../../images/part4/5.png)

---

## 4.4. Adding an Nginx Status Page

Extend `nginx.conf` with a handler for the `/status` path.

![nginx.conf](../../images/part4/6.png)

> Configuration file used in this part: [src/history/Part4/nginx.conf](../../src/history/Part4/nginx.conf)

After updating the configuration, restart the container:

```bash
docker restart hello_container
```

The Nginx status page becomes available at:

```text
http://localhost:80/status
```

![restart](../../images/part4/7.png)

---

## Summary

A custom Docker image containing a FastCGI application and Nginx was created. The application build process was integrated into the image, a custom Nginx configuration was connected, and an Nginx status page was added.

---

## Navigation

↑ [README](../../README.md)

← [Part 3. Mini Web Server](Part3.md)

→ [Part 5. Dockle](Part5.md)

---