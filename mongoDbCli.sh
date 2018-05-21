kubectl run mongodb-mongodb-client --rm --tty -i --image bitnami/mongodb \
	--command -- mongo --host mongodb-mongodb -p password