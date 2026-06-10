## Part 1. Ready-made Docker Image

> Russian version: [Part1_ru.md](../ru/Part1_ru.md)

## 1.1. Downloading the Nginx Image

Download the official Nginx image from Docker Hub:

```bash
docker pull nginx
```

![docker pull](../../images/part1/1.png)

---

## 1.2. Viewing Local Images

Verify that the image has been downloaded successfully:

```bash
docker images
```

The `nginx` image appears in the list of local images.

![docker images](../../images/part1/2.png)

---

## 1.3. Creating and Running a Container

Create a container based on the `nginx` image and start it in detached mode:

```bash
docker run -d --name my-nginx nginx
```

Command parameters:

* `-d` — runs the container in detached mode;
* `--name my-nginx` — assigns a name to the container.

The command returns the container identifier.

![docker run](../../images/part1/3.png)

---

## 1.4. Checking Container Status

View the list of running containers:

```bash
docker ps
```

The `my-nginx` container is present in the list and has the `Up` status.

![docker ps](../../images/part1/4.png)

---

## 1.5. Inspecting Container Information

Display detailed information about the container:

```bash
docker inspect my-nginx
```

The command outputs the container configuration and metadata in JSON format.

![docker inspect](../../images/part1/5.png)

---

## 1.6. Examining Container Parameters

### Published Ports

Inspect the published ports of the container:

![ports](../../images/part1/6_1.png)

The following port is available:

```text
80/tcp
```

### Container IP Address

The container IP address can be found in the `docker inspect` output.

![ip](../../images/part1/6_2.png)

Container IP address:

```text
172.17.0.2
```

### Container Size

Determine the container size using:

```bash
docker ps -s
```

![size](../../images/part1/6_4.png)

Container size:

```text
1.09 kB
```

---

## 1.7. Stopping the Container

Stop the container:

```bash
docker stop my-nginx
```

Then verify that it is no longer running:

```bash
docker ps
```

The container is no longer present in the list of running containers.

![docker stop](../../images/part1/7.png)

---

## 1.8. Running a Container with Published Ports

Create a new container with ports `80` and `443` published to the host system:

```bash
docker run -d -p 80:80 -p 443:443 nginx
```

The `-p` option maps a host port to a container port using the following format:

```text
<host_port>:<container_port>
```

In this case, the following ports are published:

* `80:80`
* `443:443`

![run](../../images/part1/8.png)

---

## 1.9. Verifying Web Server Availability

Open the following address in a browser:

```text
http://localhost:80
```

The default Nginx welcome page is displayed.

![localhost:80](../../images/part1/9.png)

---

## 1.10. Restarting the Container

Restart the container:

```bash
docker restart <container_id>
```

Then verify that it is running again:

```bash
docker ps
```

The container returns to the `Up` state.

![docker restart](../../images/part1/10.png)

---

## Summary

The official Nginx image was downloaded, a container was created and started, container parameters were inspected, port publishing was configured, and the web server was accessed through a browser.

---

## Navigation

↑ [README](../../README.md)

→ [Part 2. Operations with Container](Part2.md)

---