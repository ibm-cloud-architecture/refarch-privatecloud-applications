NAME=mongodb

./createNamespace.sh mongodb
helm delete --purge $NAME --tls
helm install -n $NAME stable/mongodb --tls \
	--set serviceType=NodePort,mongodbRootPassword=password
 