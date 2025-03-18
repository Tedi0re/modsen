# Настройка nginx clusterIP и NodePort Service с Minikube

### 1. запуск сервиса с nginx clusterIP
```.sh
kubectl apply -f nginx-clusterip-service.yml
```

### 2. проверка сервиса с nginx clusterIP
```.sh
kubectl get svc
```

### 3. запуск сервиса с nginx nodePort
```.sh
kubectl apply -f nginx-nodeport-service.yml
```

### 4. проверка сервиса с nginx nodePort
```.sh
kubectl get svc
```