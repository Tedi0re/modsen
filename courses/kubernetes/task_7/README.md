# Работа с Persistent Volumes и Persistent Volume Claims с Minikube

### 1. создание Persistent Volume
```.sh
kubectl apply -f pv.yaml
```

### 2. проверка Persistent Volume
```.sh
kubectl get pv
```
### 3. создание Persistent Volume Claims
```.sh
kubectl apply -f pvc.yaml
```

### 4. проверка Persistent Volume Claims
```.sh
kubectl get pvc
```
### 5. создание pod
```.sh
kubectl apply -f pod_task_7.yaml
```

### 6. подключение к pod
```.sh
kubectl exec -it pod-task-7 -- /bin/sh
```

### 7. изменение файла в pod
```.sh
echo "hello!!!" > /usr/share/nginx/html/index.html
```

### 8. удаление pod
```.sh
kubectl delete pod my-pod
```

### 9. создание pod  
```.sh
kubectl apply -f pod_task_7.yaml
```

### 9. проверка файла в pod  
```.sh
kubectl exec -it my-pod -- cat /usr/share/nginx/html/index.html
```