## Part 6. Базовый Docker Compose

> English version: [Part6.md](../eng/Part6.md)

## 6.1. Подготовка конфигурации Docker Compose

Создадим файл `docker-compose.yml`, который запускает два контейнера:

1. приложение из [Части 5](Part5_ru.md);
2. Nginx, выполняющий роль обратного прокси.

Порт `8080` контейнера с Nginx публикуется на порт `80` хост-машины.

![docker-compose.yml](../../images/part6/1.png)

> Финальная версия файла `docker-compose.yml`: [src/final/compose/docker-compose.yml](../../src/final/compose/docker-compose.yml)

> Версия файла `docker-compose.yml`, использованная при выполнении лабораторной работы: [src/history/Part6/docker-compose.yml](../../src/history/Part6/docker-compose.yml).

Для выполнения задания был создан отдельный `Dockerfile`.

![Dockerfile](../../images/part6/2.png)

> Файл образа, используемый в этой части: [src/history/Part6/Dockerfile](../../src/history/Part6/Dockerfile)

Конфигурация Nginx перенаправляет запросы на контейнер с приложением.

![nginx.conf](../../images/part6/3.png)

> Файл конфигурации, используемый в этой части: [src/final/compose/nginx.conf](../../src/final/compose/nginx.conf)

---

## 6.2. Подготовка окружения

Перед запуском проекта остановим и удалим ранее созданные контейнеры.

```bash
docker rm $(docker ps -a -q)
```

![docker rm](../../images/part6/4.png)

---

## 6.3. Сборка и запуск проекта

Соберём и запустим сервисы с помощью Docker Compose.

```bash
docker compose build
docker compose up -d
```

![docker-compose](../../images/part6/5.png)

После запуска будут созданы два контейнера:

* `hello_server` — FastCGI-приложение;
* `hello_nginx` — обратный прокси Nginx.

---

## 6.4. Проверка работы приложения

Откроем в браузере адреса:

```text
http://localhost:80
```
```text
http://localhost/status
```

или используем команды:

```bash
curl localhost:80
curl localhost/status
```

![docker-compose](../../images/part6/6.png)

---

## Итог

С помощью Docker Compose развернут проект из двух контейнеров: приложения и обратного прокси Nginx. Настроено взаимодействие контейнеров внутри общей сети и публикация сервиса на локальную машину.

---

## Навигация

↑ [README_ru](../../README_ru.md)

← [Part 5. Dockle](Part5_ru.md)

---