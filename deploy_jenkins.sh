./create_namespace.sh jenkins


helm delete --purge patro-jenkins

helm install --name patro-jenkins stable/jenkins --set Persistence.Size=1Gi,Master.ServiceType=ClusterIP