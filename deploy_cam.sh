PROXY_IP=169.45.207.217

function create_log_pv {
	echo Creating log PV
	kubectl delete pv d-10	
	kubectl delete pv cam-logs-nfs
	kubectl create -f cam_install/cam/pre-install/cam-logs-pv.yaml 
}

function create_db_pv {
	echo Creating DB PV
	kubectl delete pv d-11
	kubectl delete pv cam-mongo-nfs
	kubectl create -f cam_install/cam/pre-install/cam-mongo-pv.yaml 
}

function delete_log_pvc {
	echo Deleting log PVC
	kubectl delete pvc cam-logs-nfs
}


function create_log_pvc {
	delete_log_pvc
	echo Creating log PVC
	kubectl create -f cam_config/cam_log_pvc.yaml	
}

function deploy_create_log_dirs {
	echo Creating log directories
	cd cam_config
	./deploy_create_log_dirs.sh
	cd ..
}

function deploy_cam {
	echo Deploing CAM
	cd cam_install
	helm delete --purge cam
	helm install --name cam --set host.ip=$PROXY_IP --set license=accept cam
	cd ..
}

./create_namespace.sh cam

create_log_pv
create_db_pv
create_log_pvc
deploy_create_log_dirs
deploy_cam

