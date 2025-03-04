# Docker Compose: Nginx с логированием в том

Этот проект содержит `docker-compose.yml` для запуска контейнера с Nginx и сохранения логов на хосте.

## Инструкция по сборке и запуску

### 1. Соберите образ Nginx
```sh
docker build -t custom_nginx .
```

### 2. Запустите контейнер с пробросом логов
```sh
docker compose up -d
```

### 3. Проверьте доступность сервера
Перейдите в браузере по адресу:
```
http://localhost:8080
```

### 4. Убедитесь, что логи записываются
На хосте в папке `./logs` должны появиться файлы логов Nginx.

## Файлы проекта

- `Dockerfile` – инструкция для сборки контейнера Nginx.
- `docker-compose.yml` – настройка сервиса с подключенным томом для логов.