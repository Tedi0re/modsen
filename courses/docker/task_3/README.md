# Docker: Многоэтапная сборка приложения на Go

Этот проект содержит `Dockerfile` с многоэтапной сборкой для Go-приложения.

## Инструкция по сборке и запуску

### 1. Соберите образ
```sh
docker build -t task_3 .
```

### 2. Запустите контейнер
```sh
docker run --rm task_3
```

### 3. Ожидаемый вывод
При запуске контейнера в консоли должно появиться:
```
hello, world
```

## Файлы проекта

- `Dockerfile` – инструкция для многоэтапной сборки.