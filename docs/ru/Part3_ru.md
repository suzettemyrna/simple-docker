## Part 3. Мини веб-сервер

> English version: [Part3.md](../eng/Part3.md)

### 3.1. Создание FastCGI-приложения

Создадим файл `hello.c`, реализующий простое FastCGI-приложение.

![hello.c](../../images/part3/1.png)

Программа принимает запросы от веб-сервера и возвращает HTML-страницу с текстом:

```html
<h1>Hello World!</h1>
```

> Исходный код приложения: [src/final/hello.c](../../src/final/hello.c)

---

### 3.2. Запуск FastCGI-сервера

Для выполнения задания создадим новый контейнер:

```bash
docker run -d -p 81:81 nginx
```

![docker run](../../images/part3/2.png)

Установим необходимые пакеты:

```bash
docker exec -it <container_id> apt update
docker exec -it <container_id> apt upgrade -y
docker exec -it <container_id> apt install -y \
    gcc \
    libfcgi-dev \
    libfcgi0ldbl \
    spawn-fcgi
```

Скопируем исходный код в контейнер, скомпилируем программу и запустим её через `spawn-fcgi` на порту `8080`.

```bash
docker cp hello.c <container_id>:/hello.c
docker exec <container_id> gcc hello.c -o hello.fcgi -lfcgi
docker exec <container_id> spawn-fcgi -p 8080 hello.fcgi
```

![spawn-fcgi](../../images/part3/3.png)

---

### 3.3. Настройка Nginx

Создадим собственный файл конфигурации `nginx.conf`.

![nginx.conf](../../images/part3/4.png)

Основная задача этой конфигурации — принимать запросы на порту `81` и передавать их FastCGI-приложению, работающему на порту `8080`.

Ключевые директивы:

* `fastcgi_pass 127.0.0.1:8080;` — передача запроса FastCGI-серверу;
* `include fastcgi_params;` — подключение стандартных параметров FastCGI.

> Файл конфигурации, использованный в этой части: [src/history/Part3/nginx.conf](../../src/history/Part3/nginx.conf)

Скопируем конфигурацию в контейнер и перезапустим Nginx.

![nginx.conf](../../images/part3/5.png)

---

### 3.4. Проверка работы приложения

Откроем в браузере страницу:

```text
http://localhost:81
```

![localhost:81](../../images/part3/6.png)

На странице отображается ответ FastCGI-приложения.

---

## Итог

В ходе работы создано FastCGI-приложение на языке C, возвращающее страницу `Hello World!`.
Настроен запуск приложения через `spawn-fcgi` на порту `8080`.
Создана конфигурация Nginx для проксирования запросов на FastCGI-сервер.
Проверена доступность приложения через браузер.

---

## Навигация

↑ [README_ru](../../README_ru.md)

← [Part 2. Операции с контейнером](Part2_ru.md)

→ [Part 4. Свой докер](Part4_ru.md)

---