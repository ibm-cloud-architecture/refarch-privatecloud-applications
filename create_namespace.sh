CONTEXT=cfc
USER=user
NAMESPACE=$1

kubectl create namespace $NAMESPACE
kubectl config set-context $CONTEXT --user=$USER --namespace=$NAMESPACE
kubectl config get-contexts

