./create_namespace.sh istio-system

NAME=istio
CHART=./istio-0.2.7-chart5.tgz

function delete_istio {
	helm delete --purge $NAME
}

function deploy_istio {
	echo Downloading istio...
	wget https://kubernetes-charts-incubator.storage.googleapis.com/istio-0.2.7-chart5.tgz

	echo Deploying istio...
	helm install --name $NAME $CHART

}

#delete_istio
cd /tmp
#deploy_instio

echo Installing istio...
helm upgrade istio $CHART --reuse-values --set istio.install=true
