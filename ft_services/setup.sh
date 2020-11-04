#!/bin/bash
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
docker build -t mynginx srcs/nginx/  
docker build -t my_mysql srcs/mysql/  
# Create a Deployment based on the of NGINX based on generic YAML file: (https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/)
kubectl apply -f srcs/nginx/nginx.yaml

# Create a Deployment based on the of WORDPRESS based on generic YAML file: (https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/)
kubectl apply -f srcs/mysql/mysql.yaml
# and with SQL
kubectl apply -f srcs/wordpress/wordpress.yaml
# and with phpmyadmin
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
# AND GRAFANA
kubectl apply -f srcs/grafana/grafana.yaml   
# AND influxdb
kubectl apply -f srcs/influxdb/influxdb.yaml 
# AND telegraf
kubectl apply -f srcs/influxdb/telegraf.yaml 
# and with FTPS
# kubectl apply -f srcs/ftps/vsftpd.conf
# kubectl apply -f srcs/ftps/ftps.yaml

# printf "Building and deploying nginx:\t\t"
# docker build -t nginx_alpine ./srcs/nginx 
# # > /dev/null 2>>errlog.txt && printf "[${grn}OK${end}]\n" || printf "[${red}NO${end}]\n"; kubectl apply -f ./srcs/nginx.yaml >> log.log 2>> errlog.txt
# # get a nginx file using alpine linux and try and get it working
# # metalb needed to make this work
# # docker run -d -p 80:80 nginx_alpine
# docker ps
# ifconfig
