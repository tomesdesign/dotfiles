
Suppose having built the custom docker image from [Build a Simple Docker Image for Microservice](Build a Simple Docker Image for Microservice.md)
It can be service in whatever language. Using go here.
Run:
- sh code block below:
```sh
	docker run -it -p 8333:8080 tomesm/mfolio-backend:0.1.0
	```
	- `-p` specifies ports:
		- `8333` host (we can call rthe service on `localhost:8333`)
		- `8080` the container port on which the app is running. Must be exposed in [Dockerfile](Dockerfile.md)
	- `-e` we can use this flag to specify the environment variable:
		- sh code block below:
		```sh
			docker run -it -e "PORT=9090" -p 8333:9090 mfolio-backend:0.1.3
			Server starting on port :9090...
			```
- It is not practical to run in interactively, thus we can run it in background with `-d` daemon flag and also provide a name to the container for better managing (stopping):
	- sh code block below:
	```sh
		docker run --name cloud-native-go -d -p 8888:8888 mfolio-backend:0.1.3
		```
- check if its running:
	- sh code block below:
	```sh
		docker ps
		CONTAINER ID	IMAGE						COMMAND					CREATED		 STATUS		 PORTS										NAMES
		d74f4f6e0ce6	mfolio-backend:0.1.3		 "./mfolio-backend"		6 seconds ago	Up 4 seconds	0.0.0.0:8888-\>8888/tcp, :::8888-\>8888/tcp	cloud-native-go
		```
- optionaly, you can specify resources:
	- sh code block below:
	```sh
		docker run --name cloud-native-go --cpu-quota 50000 --memory 64m --memory-swapiness 0 -d -p 8888:8888 mfolio-backend:0.1.3
		```
	- **--cpu-quota** (e.g., `--cpu-quota=50000`):
		- Limits the container to a specific amount of CPU time.
		- Used together with `--cpu-period` (default 100000 microseconds), it sets how much CPU the container can use per period.
		- For example, `--cpu-quota=50000` with the default period means the container can use 50% of one CPU core
	- **--memory** (e.g., `--memory=64m`):
		- Sets the maximum amount of RAM the container can use.
		- For example, `--memory=64m` restricts the container to 64 megabytes of memory
	- **-memory-swappiness** (e.g., `--memory-swappiness=0`):
		- Controls how aggressively the container’s memory pages are swapped to disk.
		- A value of `0` minimizes swapping (only swap when absolutely necessary), while `100` swaps very aggressively.
		- Values range from 0 to 100. This option is ignored unless swap is enabled for the container
Stop:
- just stop using the name
	- sh code block below:
	```sh
		docker stop cloud-native-go
		```