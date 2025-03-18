# Работа с ConfigMaps и Secrets с Minikube

### 1. создание configMap
```.sh
kubectl apply -f configmap.yaml
```

### 2. проверка configMap
```.sh
kubectl get configmap
```
### 3. нужно создать приватный репозиторий на https://hub.docker.com/

### 4. создание образа docker
```.sh
docker build -t my-private-app .
```

### 5. логин в консоли
```.sh
docker login
```

### 6. push образа
```.sh
docker tag my-private-app <your-dockerhub-username>/my-private-app:latest
docker push <your-dockerhub-username>/my-private-app:latest
```

### 7. создание секрета
```.sh
kubectl create secret docker-registry regcred 
  --docker-server=https://index.docker.io/v1/ 
  --docker-username=<your-dockerhub-username> 
  --docker-password=<your-dockerhub-password> 
  --docker-email=<your-email>
```


### 8. проверка секрета
```.sh
kubectl get secret
```

### 9. создание pod  
```.sh
kubectl apply -f pod.yaml
```

### 9. проверка pod  
```.sh
kubectl get pods
```