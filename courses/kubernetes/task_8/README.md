# Настройка Ingress

### 1. Включение ingress контроллера
```.sh
minikube addons enable ingress
```
### 2. При включении возникает ошибка
```.sh
Exiting due to MK_ADDON_ENABLE: enable failed: run callbacks: running callbacks: [waiting for app.kubernetes.io/name=ingress-nginx pods: context deadline exceeded]
```
### Шаги по исправлению