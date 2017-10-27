./create_namespace.sh ingress

NAME=ingress

helm delete --purge $NAME
helm install --name $NAME stable/nginx-ingress
