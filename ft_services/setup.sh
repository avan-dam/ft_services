#!/bin/bash
rm -rf ~/.minikube
mkdir -p ~/goinfre/.minikube
ln -s ~/goinfre/.minikube ~/.minikube

minikube start	--vm-driver=virtualbox  \
				--disk-size=15GB \
				--addons metalldb \
				--addons dashboard \

# install MetalLB by manifest
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml

# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
# MetalLB remains idle until configured. This is accomplished by creating and deploying a configmap
kubectl apply -f srcs/metallb-system.yaml

eval $(minikube docker-env)
# build local images using docker files
# docker build -t my_ftps srcs/ftps/  
docker build -t mynginx srcs/nginx/  
docker build -t my_mysql srcs/mysql/  
docker build -t my_phpmyadmin srcs/phpmyadmin/  
# docker build -t my_wordpress srcs/wordpress/  
# docker build -t my_grafana srcs/grafana/  
# docker build -t my_influxdb srcs/influxdb/  
# docker build -t my_telegraf srcs/telegraf/  

# create all deployments and expose the service 
# kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/mysql/mysql.yaml
# kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
# kubectl apply -f srcs/grafana/grafana.yaml   
# kubectl apply -f srcs/telegraf/telegraf.yaml 
# kubectl apply -f srcs/influxdb/influxdb.yaml 

