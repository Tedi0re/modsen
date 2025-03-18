# Настройка Kubernetes с Minikube

Настройка Kubernetes с Minikube на Ubuntu, включая установку Docker и Kubectl.

## Инструкция настройки

### 1. Установка Minikube
Скачивание последней версии Minikube и установка в систему:
```.sh
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

### 2. Установка Docker
Обновляем систему и устанавливаем необходимые зависимости:
```.sh
sudo apt-get update
sudo apt-get install ca-certificates curl
```
Добавляем официальный GPG-ключ Docker:
```.sh
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```
Добавляем репозиторий Docker в систему:
```.sh
echo \  
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \  
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \  
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

Устанавливаем Docker и плагины:
```.sh
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### 3. Запуск Minikube
Запускаем Minikube с драйвером Docker:
```.sh
minikube start --driver=docker --force
```

### 4. Установка Kubectl
Скачиваем последнюю версию Kubectl:
```.sh
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

Скачиваем и проверяем контрольную сумму:
```.sh
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"   

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
```

Устанавливаем Kubectl в систему:
```.sh
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

