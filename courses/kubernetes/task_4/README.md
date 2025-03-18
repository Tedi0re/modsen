# Настройка nginx deployment с Minikube

### 1. запуск pods с nginx
```.sh
kubectl apply -f nginx-deployment.yaml
```

### 2. проверка pods deployments с nginx
```.sh
kubectl get deployments
```

### 3. обновление образа контейнера на nginx 1.27.4
```.sh
kubectl set image deployment/nginx-deployment nginx=nginx:1.27.4
```

### 4. проверка процесса обновления
```.sh
kubectl rollout status deployment/nginx-deployment
```

### 5. откат к предыдущей версии образа nginx
```.sh
kubectl rollout undo deployment/nginx-deployment
```