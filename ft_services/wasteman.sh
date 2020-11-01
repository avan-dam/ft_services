  
# kubectl delete svc --all

# kubectl delete deployments --all

# kubectl delete secrets --all

# kubectl delete configmap --all

# kubectl delete pv --all

# kubectl delete pods --all

# docker rmi mynginx
# docker rmi myphp
# docker rmi mysql
docker system prune -a -f
kubectl delete deployment nginx
kubectl delete service nginx

docker build -t mynginx srcs/nginx/
# docker build -t myphp srcs/phpmyadmin/
# docker build -t mysql srcs/mysql/
# docker build -t mywordpress srcs/wordpress/

# The deployments
kubectl apply -f srcs/nginx/nginx.yaml
# kubectl apply -f srcs/mysql/wordpress-mysql.yaml
# kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
# kubectl apply -f srcs/wordpress/wordpress.yaml

# kubectl apply -f srcs/ftps.yaml
# kubectl apply -f srcs/grafana.yaml
# kubectl apply -f srcs/influxdb.yaml
# kubectl apply -f srcs/telegraf.yaml