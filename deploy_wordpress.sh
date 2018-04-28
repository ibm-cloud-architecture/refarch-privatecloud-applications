TILLER_NAMESPACE=default

./create_namespace.sh wordpress

NAME=wordpress
HELM_OPTIONS="--tiller-namespace=$TILLER_NAMESPACE"

helm delete --purge $NAME $HELM_OPTIONS
helm install --name $NAME stable/wordpress $HELM_OPTIONS