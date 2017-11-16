NAME=kube-ops

echo Deleting kube-ops
helm delete --purge $NAME

echo Deploying kube-ops
helm install --name=$NAME --set service.type=NodePort stable/kube-ops-view