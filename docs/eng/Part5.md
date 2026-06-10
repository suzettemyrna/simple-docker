## Part 5. Dockle

> Russian version: [Part5_ru.md](../ru/Part5_ru.md)

## 5.1. Scanning the Image with Dockle

The `Dockle` utility is used to analyze Docker image security.

Build the image from the files created in [Part 4](Part4.md) and save it as an archive:

```bash
docker build -t hello:v2 .
docker save hello:v2 -o hello.tar
```

![docker save](../../images/part5/1.png)

Run the scan:

```bash
dockle --input hello.tar
```

![dockle](../../images/part5/2.png)

The scan reports:

* errors (*FATAL*);
* warnings (*WARN*);
* recommendations (*INFO*).

The main issues were related to running the container as `root`, not cleaning the `apt` cache, and several additional security recommendations.

---

## 5.2. Fixing Dockle Findings

Update the `Dockerfile` to address the reported issues.

![Dockerfile](../../images/part5/3.png)

The updated version:

* cleans the `apt` cache after package installation;
* creates a dedicated user named `hello_user`;
* configures permissions for Nginx files and directories;
* removes SUID bits from system utilities;
* adds a `HEALTHCHECK` instruction;
* runs the container as a non-root user.

After applying the changes, rebuild the image and run the scan again:

```bash
docker build -t hello:v3 .
dockle hello:v3
```

![dockle](../../images/part5/4.png)

After the modifications, the report contains no errors or warnings. Only informational recommendations remain.

> Dockerfile used in this part: [src/history/Part5/Dockerfile](../../src/history/Part5/Dockerfile)

> The same [application startup script](../../src/final/run.sh) and the same [`nginx.conf`](../../src/final/nginx.conf) from [Part 4](Part4.md) are used in this part.

---

## Summary

The Docker image was analyzed with `Dockle` and updated to address security findings. A non-root user, a health check, and additional security-related configuration were added.

---

## Navigation

↑ [README](../../README.md)

← [Part 4. Custom Docker Image](Part4.md)

→ [Part 6. Basic Docker Compose](Part6.md)

---