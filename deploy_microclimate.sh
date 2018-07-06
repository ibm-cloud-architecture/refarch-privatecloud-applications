./switch_namespace.sh default

helm delete --purge mc --tls

SECRET=microclimate-icp-secret
kubectl delete secret $SECRET
kubectl create secret docker-registry $SECRET --docker-server=mycluster.icp:8500 --docker-username=admin --docker-password=admin --docker-email=admin@admin.com

kubectl patch serviceaccount default -p '{"imagePullSecrets": [{"name": "microclimate-icp-secret"}]}'

helm install --name mc ibm-charts/ibm-microclimate --tls --set hostName="169.55.73.156.nip.io"