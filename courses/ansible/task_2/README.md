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
An exception occurred during task execution. To see the full traceback, use -vvv. The error was: SyntaxError: future feature annotations is not defined
```

в generic/fedora28 python версии 3.6.8, необходимо обновление до 3.8.*
### 5. Обновление python на узле fedora
Установка и распаковка исходного архива
```.sh
wget https://www.python.org/ftp/python/3.8.11/Python-3.8.11.tgz
tar xzf Python-3.8.11.tgz Python-3.8.11/
cd Python-3.8.11/
```
Установка zlib
```.sh
sudo dnf install -y zlib-devel
```
Настройка конфигурации
```.sh
./configure --enable-optimizations --with-ensurepip=install
```
Сборка Python 3.8.11
```.sh
sudo make altinstall
```
Проверка библиотеки zlib
```.sh
python3.8 -c "import zlib; print(zlib.__version__)"
```
Проверка ansible ping на узле ansible с указанием нужной версии python
```.sh
ansible all -i 172.16.0.23, -u vagrant -m ping -e ansible_python_interpreter=/usr/local/bin/python3.8
```
Результат
```.sh
172.16.0.23 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```