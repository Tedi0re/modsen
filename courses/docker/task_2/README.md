# Docker Compose: Ubuntu + PostgreSQL

Этот проект содержит `docker-compose.yml` для запуска двух контейнеров:
- **Ubuntu** с установленным `postgresql-client`
- **PostgreSQL 14.16`

Контейнеры соединены в общей сети, что позволяет Ubuntu подключаться к базе данных.

## Инструкция по запуску

### 1. Создайте файл `.env`
Добавьте в него переменные окружения для PostgreSQL:

```
POSTGRES_USER=your_user
POSTGRES_PASSWORD=your_password
POSTGRES_DB=your_database
```

### 2. Соберите образ Ubuntu
```sh
docker build -t task_2_ubuntu .
```

### 3. Запустите сервисы
```sh
docker compose up --build -d
```

### 4. Подключитесь к Ubuntu-контейнеру
```sh
docker exec -it ubuntu bash
```

### 5. Проверьте соединение с PostgreSQL
```sh
PGPASSWORD=$POSTGRES_PASSWORD psql -h postgres -U $POSTGRES_USER -d $POSTGRES_DB
```

## Файлы проекта

- `Dockerfile` – инструкция для сборки контейнера Ubuntu.
- `docker-compose.yml` – конфигурация для запуска сервисов.
- `.env` – файл с переменными окружения для PostgreSQL.