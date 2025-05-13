#docker

# Rancher Desktop

Runs its own context called "rancher-desktop"

check it:
```sh
docker context ls
NAME				DESCRIPTION								DOCKER ENDPOINT						ERROR
default *		 Current DOCKER_HOST based configuration	unix:///var/run/docker.sock
rancher-desktop	Rancher Desktop moby context				unix:///Users/martin/.rd/docker.sock
```
  
switch it:
```sh
docker context use rancher-desktop
rancher-desktop
Current context is now "rancher-desktop"
```
