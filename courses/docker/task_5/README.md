# Docker Compose: PostgreSQL с переменными окружения

Этот проект содержит `docker-compose.yml` для запуска контейнера PostgreSQL с настройкой через переменные окружения.

## Инструкция по запуску

### 1. Создайте файл `.env`
Добавьте в него параметры для базы данных:

```
POSTGRES_USER=user
POSTGRES_PASSWORD=password
POSTGRES_DB=db
```

### 2. Запустите контейнер PostgreSQL
```sh
docker compose up -d
```

### 3. Подключитесь к контейнеру
```sh
docker exec -it postgres bash
```

### 4. Проверьте подключение к базе данных
```sh
PGPASSWORD=password psql -h postgres -U user -d db


## Файлы проекта

- `docker-compose.yml` – настройка контейнера PostgreSQL с переменными окружения.
- `.env` – файл с конфигурацией базы данных.