---
ulr: https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Farm64%2Fstable%2Fbinary+download
tags: #Devops #Kubernetes
---


Tool for running [Kubernetes](Kubernetes.md) locally
Runs a linux VM inside which he run a single-node k8s cluster
- no #High_Availability
For testing and devleopment. DO NOT USE IN PRODUCTION

## Prerequisites
- In my case i am using mac and [Docker](Docker.md) Desktop and it just works with brew
- It seems that it uses Docker Desktop VM capabilities and there is no need to download Virtual Box as suggested in the Udemy course
	- 

## Installation
- sh code block below:
```sh
	brew install minikube
	```
- sh code block below:
```sh
	minikube start
	```
	- Output should be like:
	- sh code block below:
	```sh
		😄	minikube v1.35.0 on Darwin 15.3.2 (arm64)
		✨	Automatically selected the docker driver. Other choices: qemu2, ssh
		📌	Using Docker Desktop driver with root privileges
		👍	Starting "minikube" primary control-plane node in "minikube" cluster
		🚜	Pulling base image v0.0.46 ...
		💾	Downloading Kubernetes v1.32.0 preload ...
			\> preloaded-images-k8s-v18-v1...:	314.92 MiB / 314.92 MiB	100.00% 5.19 Mi
			\> gcr.io/k8s-minikube/kicbase...:	452.84 MiB / 452.84 MiB	100.00% 5.54 Mi
		🔥	Creating docker container (CPUs=2, Memory=4000MB) ...
		🐳	Preparing Kubernetes v1.32.0 on Docker 27.4.1 ...
			▪ Generating certificates and keys ...
			▪ Booting up control plane ...
			▪ Configuring RBAC rules ...
		🔗	Configuring bridge CNI (Container Networking Interface) ...
		🔎	Verifying Kubernetes components...
			▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
		🌟	Enabled addons: default-storageclass, storage-provisioner
		🏄	Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
		```

## Operating
- after the `start` command `.minikube` and `.kube` folders are created in the home folder
- in the `.kube/config` we can see minikube created certificates for us and other settings
- you can run a dashbord: `minikube dashboard`
- you can follow this doc: https://kubernetes.io/docs/tutorials/hello-minikube/
	- operate the cluster via [kubectl](kubectl.md):
		- ### Create Deployment
			- use [deployment](kubectl/create/deployment.md) to create hello world deployment with docker container:
				- sh code block below:
				```sh
					# Run a test container image that includes a webserver
					kubectl create deployment hello-node --image=registry.k8s.io/e2e-test-images/agnhost:2.39 -- /agnhost netexec --http-port=8080
					```
			- Then verify the deployments with #kubectl/get/deployments:
				- sh code block below:
				```sh
					NAME		 READY	UP-TO-DATE	AVAILABLE	AGE
					hello-node	1/1	 1			1			5m55s
					```
			- We can view cluster events with [events](kubectl/get/events.md)
			- View the `kubectl` configuration with [view](kubectl/config/view.md)
			- View application logs for a conainer in a pod (replace pod name with output from [pods](kubectl/get/pods.md) ) using #kubectl/logs
				- sh code block below:
				```sh
					kubectl logs hello-node-c74958b5d-sl8vx
					```
		- ### Create service
			- Now we can expose the pod to the Internet as Kubernetes service using [expose](kubectl/expose.md):
				- sh code block below:
				```sh
					kubectl expose deployment hello-node --type=LoadBalancer --port=8080
					```
				- check with #kubectl/get/services
			- We can run service with minikube now:
				- sh code block below:
				```sh
					minikube service hello-node
					```
		- ### Shut Down
			- To stop the minikube just run `minikube stop`
		- ### Deletion
			- To coempletly delete deployments/cluster run `minikube delete`
			- 
- 
- 