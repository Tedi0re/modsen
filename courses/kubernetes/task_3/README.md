# Настройка nginx replicaset с Minikube

### 1. запуск pods с nginx
```.sh
kubectl apply -f nginx-replicaset.yaml
```

### 2. проверка pods replicaset с nginx
```.sh
kubectl get rs
```