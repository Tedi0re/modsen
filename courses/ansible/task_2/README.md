# Настройка беспарольного SSH

Настройка беспарольного SSH от контрольного узла (ansible) к управляемым узлам (ubuntu и fedora), и проверка с помощью ssh ping и ansible

## Инструкция настройки 

### 1. Генерация ключей на контрольном узле (ansible)
```.sh
ssh-keygen -t rsa -b 4096
```
при генерации ключей, парольную вразу нужно оставить пустой 
### 2. Загрузка открытого ключа на управляемые узлы
Загрузка ключа с ansible на ubuntu
```.sh
ssh-copy-id vagrant@172.16.0.22
```
Загрузка ключа с ansible на fedora
```.sh
ssh-copy-id vagrant@172.16.0.23
```

### 3. Установка ansible
На узле ansible 
```.sh
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
python3 -m pip install ansible
```
### 4. Проверка подключения
Проверка по SSH на узле ansible

ubuntu:
```.sh
ssh vagrant@172.16.0.22
exit
```
fedora:
```.sh
ssh vagrant@172.16.0.23
exit
```

Проверка с помощью ansible ping на узле ansible

ubuntu:
```.sh
ansible all -i 172.16.0.22, -u vagrant -m  ping
```
Результат
```.sh
172.16.0.22 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.10"
    },
    "changed": false,
    "ping": "pong"
}
```

fedora:
```.sh
ansible all -i 172.16.0.23, -u vagrant -m  ping
exit
```

Результат
```.sh
172.16.0.23 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.8"
    },
    "changed": false,
    "ping": "pong"
}
```
