---
alias: k8s
---



## Overview
- Core of any [Cloud](Cloud.md) solution/infrastructure
- [Container](Container.md) orchestration tool allowing:
	- provisioning nodes
	- *schedule* Containers on cluster of machines (on-prem or VM)
	- run multiple containers on one machine
	- run long running applications (eg,. web services )
	- managing state of the containers
		- start (instantiate on a host - inside a [Pod](Pod.md) )
		- restart
		- move from a node to node
	- scale the cluster
- Orchestration:
	- instead of running few containers separately and taking care about them manually we can automate this
	- allows us to scale up to thousands of nodes and containers
	- some other
- Deployment types:
	- on-premise (own datacenter)
	- Public Cloud (AWS, Azure, GCP)
	- Hybrid: some workload on-prem, some onm public cloud
	- 

## Setup
- ### Local (testing) clusters
	- [Minikube](Minikube.md)
	- [Docker](Docker.md) Desktop Kubernetes
- Production clusters
	- NOTE: No need to have both, just one of them
	- [kops](kops.md) was best for #AWS
		- integration with AWS automatically
		- However, nowadays the AWS EKS is already available and might be better
	- #eksctl (AWS EKS). Probably preferred dor AWS
	- [kubeadm](kubeadm.md) is alternative to kops (dont have AWS integration). it's more generic tool
	- 
	- 





## Sources
- https://www.udemy.com/course/learn-devops-the-complete-kubernetes-course/learn/lecture/6014372#overview
- https://www.udemy.com/course/learning-path-go-building-cloud-native-go-applications/learn/lecture/7546998#overview
- 
Alternatives:
- Podman?
- 
