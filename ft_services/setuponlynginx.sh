#!/bin/bash
alias clearhome='echo -n "Available before:\t"; df -h | grep /Users/avan-dam | sed '\''s/  */:/g'\'' | cut -d '\'':'\'' -f 4; unsetopt nomatch; rm -Rf ~/Library/*.42_cache_bak*; rm -Rf ~/*.42_cache_bak_*; setopt nomatch; echo -n "Available after:\t"; df -h | grep /Users/avan-dam | sed '\''s/  */:/g'\'' | cut -d '\'':'\'' -f 4;'
alias clearhome="echo -n \"Available before:\t\"; df -h | grep $HOME | sed 's/  */:/g' | cut -d ':' -f 4; unsetopt nomatch; rm -Rf ~/Library/*.42_cache_bak*; rm -Rf ~/*.42_cache_bak_*; brew cleanup; rm -rf $(brew --cache); setopt nomatch; echo -n \"Available after:\t\"; df -h | grep $HOME | sed 's/  */:/g' | cut -d ':' -f 4;"
minikube stop 

minikube delete
rm -rf ~/.minikube
mkdir -p ~/goinfre/.minikube
ln -s ~/goinfre/.minikube ~/.minikube

minikube start	--vm-driver=virtualbox  \
				--cpus=2 --memory 2500 \
                --addons dashboard

# install MetalLB by manifest
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml

# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
# MetalLB remains idle until configured. This is accomplished by creating and deploying a configmap
kubectl apply -f srcs/metallb.yaml

eval $(minikube docker-env)
docker build -t my_ftps srcs/ftps/  

# Create a Deployment based on the of NGINX based on generic YAML file: (https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/)
kubectl apply -f srcs/ftps/ftps.yaml

