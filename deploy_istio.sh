NAME=istio
CHART=./istio-0.2.7-chart5.tgz
NAMESPACE=istio-system

function delete_istio {
	helm delete --purge $NAME
}

function deploy_istio {
	echo Downloading istio...
	wget https://kubernetes-charts-incubator.storage.googleapis.com/istio-0.2.7-chart5.tgz

	echo Deploying istio...
	helm install --name $NAME $CHART

}

function install_istio {
	echo Installing istio...
	helm upgrade istio $CHART --reuse-values --set istio.install=true
}

function grant_permission {
	echo Granting permission
	kubectl create clusterrolebinding cluster-admin-binding-2 --clusterrole=cluster-admin \
		--user=system:serviceaccount:default:$NAMESPACE

}

./switch_namespace.sh default
delete_istio
cd /tmp
deploy_istio

install_istio
