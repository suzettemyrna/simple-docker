## Part 4. Свой докер

> English version: [Part4.md](../eng/Part4.md)

## 4.1. Создание Docker-образа

Создадим образ, который:

1. компилирует FastCGI-приложение из [Части 3](Part3_ru.md);
2. запускает его на порту `8080`;
3. использует собственную конфигурацию Nginx;
4. запускает Nginx внутри контейнера.

Для этого создадим файл `Dockerfile`.

![Dockerfile](../../images/part4/1.png)

Основные инструкции:

* `FROM nginx:latest` — использование официального образа Nginx в качестве базового;
* `WORKDIR` — установка рабочей директории;
* `RUN` — установка необходимых пакетов;
* `COPY` — копирование исходных файлов в образ;
* `ENTRYPOINT` — команда, выполняемая при запуске контейнера.

> Файл образа, использованный в этой части: [src/history/Part4/Dockerfile](../../src/history/Part4/Dockerfile)

Для запуска приложения создадим скрипт `run.sh`.

![run.sh](../../images/part4/2.png)

Скрипт выполняет компиляцию FastCGI-приложения, запускает его на порту `8080`, после чего запускает Nginx.

> Исходный код скрипта: [src/final/run.sh](../../src/final/run.sh)

---

## 4.2. Сборка образа

Соберём образ с именем `hello` и тегом `v1`.

```bash
docker build -t hello:v1 .
```

После завершения сборки проверим наличие образа:

```bash
docker images
```

![docker build](../../images/part4/3.png)

---

## 4.3. Запуск контейнера

Запустим контейнер на основе созданного образа.

```bash
docker run -d \
  -p 80:81 \
  -v ./nginx/nginx.conf:/etc/nginx/nginx.conf \
  --name hello_container \
  -d \
  hello:v1
```

Параметр `-v` монтирует локальный файл конфигурации Nginx внутрь контейнера, что позволяет изменять настройки без пересборки образа.

![docker run](../../images/part4/4.png)

Проверим работу приложения:

```bash
curl http://localhost:80
```

![localhost:80](../../images/part4/5.png)

---

## 4.4. Добавление страницы статуса Nginx

Допишем в файл `nginx.conf` обработчик для пути `/status`.

![nginx.conf](../../images/part4/6.png)

> Файл конфигурации, используемый в этой части: [src/history/Part4/nginx.conf](../../src/history/Part4/nginx.conf)

После изменения конфигурации перезапустим контейнер:

```bash
docker restart hello_container
```

После перезапуска страница состояния Nginx становится доступна по адресу:

```text
http://localhost:80/status
```

![restart](../../images/part4/7.png)

---

## Итог

Создан собственный Docker-образ с FastCGI-приложением и Nginx. Настроена сборка приложения внутри контейнера, подключена пользовательская конфигурация Nginx и добавлена страница состояния сервера.

---

## Навигация

↑ [README_ru](../../README_ru.md)

← [Part 3. Мини веб-сервер](Part3_ru.md)

→ [Part 5. Dockle](Part5_ru.md)

---