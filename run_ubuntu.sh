kubectl delete po ubuntu

echo Starting ubuntu
kubectl run -i --tty ubuntu --image=patrocinio/ubuntu --restart=Never -- /bin/bash 