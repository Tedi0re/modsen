# Настройка nginx с Minikube

### 1. запуск pod с nginx
```.sh
kubectl apply -f nginx.yaml
```

### 2. проверка pod с nginx
```.sh
kubectl get pods
```

### 3. удаление pod с nginx
```.sh
kubectl delete pod nginx
```

### 4. повторный запуск pod с nginx
```.sh
kubectl apply -f nginx.yaml
```