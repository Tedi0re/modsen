#!/bin/bash
set -e

echo "overlay" | tee /etc/modules-load.d/k8s.conf
echo "br_netfilter" | tee -a /etc/modules-load.d/k8s.conf

modprobe overlay
modprobe br_netfilter

echo -e "net.bridge.bridge-nf-call-ip6tables = 1\nnet.bridge.bridge-nf-call-iptables = 1\nnet.ipv4.ip_forward = 1" > /etc/sysctl.d/10-k8s.conf
sysctl --system

swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab

apt-get update -y
apt-get install -y apt-transport-https ca-certificates curl gpg

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list

apt update -y

apt-get install -y containerd

mkdir -p /etc/containerd
containerd config default | tee /etc/containerd/config.toml

sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml

systemctl restart containerd
systemctl enable containerd


apt install -y kubelet=1.28.15-1.1 kubeadm=1.28.15-1.1 kubectl=1.28.15-1.1

if [ "$(hostname)" == "master" ]; then
    kubeadm init --apiserver-advertise-address=172.16.0.2 --pod-network-cidr=10.244.0.0/16

    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config

    kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
    TOKEN=$(kubeadm token create)
    HASH=$(openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | \
           openssl rsa -pubin -outform der 2>/dev/null | \
           openssl dgst -sha256 -hex | awk '{print $2}')

    echo "TOKEN=${TOKEN}" > /tmp/k8s_info
    echo "HASH=${HASH}" >> /tmp/k8s_info
fi

#kubeadm join 172.16.0.2:6443 --token $TOKEN --discovery-token-ca-cert-hash sha256:$HASH