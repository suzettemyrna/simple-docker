## Part 2. Operations with Container

> Russian version: [Part2_ru.md](../ru/Part2_ru.md)

### 2.1. Viewing the Nginx Configuration

To display the contents of the configuration file inside a running container, execute:

```bash
docker exec -it <container_id|container_name> cat /etc/nginx/nginx.conf
```

where:

* `docker exec` — executes a command inside a running container;
* `cat` — displays the contents of a file.

The command outputs the contents of `nginx.conf` from the container.

![docker exec](../../images/part2/1.png)

---

### 2.2. Creating a Custom nginx.conf File

Create an `nginx.conf` file on the host machine and configure a server status page at `/status`.

![nginx.conf](../../images/part2/2.png)

Main directives:

* `http {}` — HTTP configuration block;
* `server {}` — web server definition;
* `listen 80;` — listens for incoming connections on port 80;
* `location /status {}` — handles requests to `/status`;
* `stub_status on;` — enables the Nginx status page.

---

### 2.3. Copying the Configuration into the Container

Copy the new configuration file into the container, replacing the existing one:

```bash
docker cp nginx.conf <container_id|container_name>:/etc/nginx/nginx.conf
```

![docker cp](../../images/part2/3.png)

---

### 2.4. Applying the New Configuration

Reload Nginx inside the container to apply the updated configuration:

```bash
docker exec <container_id|container_name> nginx -s reload
```

![docker exec](../../images/part2/4.png)

---

### 2.5. Verifying the Status Page

Open the following address in a browser:

```text
http://localhost/status
```

![localhost/status](../../images/part2/5.png)

The page displays Nginx runtime statistics.

Main parameters:

* `Active connections` — number of active connections;
* `accepts` — total accepted connections;
* `handled` — total handled connections;
* `requests` — total processed HTTP requests;
* `Reading` — connections currently reading data;
* `Writing` — connections currently sending responses;
* `Waiting` — idle keep-alive connections.

---

### 2.6. Exporting the Container

Export the container filesystem to an archive named `container.tar`:

```bash
docker export <container_id|container_name> > container.tar
```

![container.tar](../../images/part2/6.png)

---

### 2.7. Stopping the Container

Stop the container:

```bash
docker stop <container_id|container_name>
```

![docker stop](../../images/part2/7.png)

---

### 2.8. Removing the Image

Remove the image from the local Docker storage without deleting the container:

```bash
docker rmi <image_id|repository>
```

![docker rmi](../../images/part2/8.png)

---

### 2.9. Removing the Container

Remove the stopped container:

```bash
docker rm <container_id|container_name>
```

Verify that the container has been removed:

```bash
docker ps -a
```

This command displays all containers, including stopped ones.

![docker rm](../../images/part2/9.png)

---

### 2.10. Importing the Container

Create a new image from the previously exported archive:

```bash
docker import \
-c 'cmd ["nginx","-g","daemon off;"]' \
-c 'ENTRYPOINT ["/docker-entrypoint.sh"]' \
container.tar nginx
```

where:

* `CMD` specifies the command executed when the container starts;
* `ENTRYPOINT` defines the container entry point;
* `container.tar` is the imported archive;
* `nginx` is the name of the new image.

The command returns the SHA256 hash of the created image.

![docker import](../../images/part2/10.png)

---

### 2.11. Running the Imported Image

Create and start a container based on the imported image:

```bash
docker run -d -p 80:80 nginx
```

Check the container status:

```bash
docker ps
```

![docker run](../../images/part2/11.png)

---

### 2.12. Verifying the Status Page Again

Open:

```text
http://localhost/status
```

![localhost/status](../../images/part2/12.png)

The status page remains available after exporting, removing, importing, and recreating the image and container.

---

## Summary

The Nginx configuration inside the container was modified, and the container was exported and imported through an archive. The service remained operational after recreating the image and container.

---

## Navigation

↑ [README](../../README.md)

← [Part 1. Ready-made Docker Image](Part1.md)

→ [Part 3. Mini Web Server](Part3.md)

---