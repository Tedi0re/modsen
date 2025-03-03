#!/bin/bash
set -e

sudo sed -i 's|https://pkgs.k8s.io/core:/stable:/v1.28/deb/|https://pkgs.k8s.io/core:/stable:/v1.29/deb/|' /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt install -y kubelet=1.29.14-1.1 kubeadm=1.29.14-1.1 kubectl=1.29.14-1.1

sudo sed -i 's|https://pkgs.k8s.io/core:/stable:/v1.29/deb/|https://pkgs.k8s.io/core:/stable:/v1.30/deb/|' /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt install -y kubelet=1.30.0-1.1 kubeadm=1.30.10-1.1 kubectl=1.30.10-1.1