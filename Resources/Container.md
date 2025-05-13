---
alias: Containers
tags: #Devops
---


A linux **container** is just an isolated **linux namespace**
- This means, it is a running process which can not interfere with main user space
- That's why container is not a virtualisation: it runs a separate process, not a separate OS
	- There is no kernel inside a docker image
	- The linux kernel is shared
	- No chance the container see the host kernel

The container **image is a file** contains just enough OS tools to run whatever application
- File system
- Liberaries
- Shell
- Distribution (alpine, debian, arch, etc) specific tools
	- This means a container can pretend it is a specific linux distro
- Linux kernel is shared across all containers
- 
It's always linux container. The full name should be not just "container" but "linux container"
- [Docker](Docker.md) Dektop on Win or Macs actuially runs tiny virtual machine with linux OS upon which other containers are running.

#Container_runtime
- A program that manages all the containers
	- Sets them up
	- Monitors them
	- Shuts them down
- Most common in [Kubernetes](Kubernetes.md):
	- [Docker](Docker.md)
	- containerd
- The runtime must run on a k8s node
- 
- 
Typical workflow:
- Image -\>
	- docker run -\>
		- runing container
			- on which we can install any dependencies or programs to run
				- this customized image can be pulled as a new one
				- original image is not affected
				- `stopped customized container -\> docker commit -\> new image`
				- `docker commit —container-custom-name —my-image-name`
Docker Instance
- A runtime instance of a Docker image containing:
	- 1. A docker image
	- 2. An execution environment
	- 3. A standard set of instructions

The same container image can be run everywhere:
- it will behave the same on:
	- laptops
	- data centers
	- VMw
	- public cloud

## Benefits
- consistent environments - no process difference betveen dev and production environments
- simple scaling - fast deployment.
- Devops team can isolate and debug issues at the container level.
	- this bring close parity between dev and QA
- all dependencies in the container not on my machine
- makes development faster
- enables automated deployment (and make it easy)
- I can easily test side effects caused by [Procedures](Procedures.md)
	- eg. if i write code to change user name/account
		- with container I can do this without messing my own system
		- 

Because it is not feasible to manage,scale,operate big applications consisting of hundreds of containers, we use container orchestration tool called [Kubernetes](Kubernetes.md)
