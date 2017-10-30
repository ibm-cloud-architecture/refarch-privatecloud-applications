./create_namespace.sh jenkins

NAME=jenkins

helm delete --purge $NAME

helm install --name $NAME stable/jenkins --set Persistence.Size=1Gi,Master.ServiceType=NodePort