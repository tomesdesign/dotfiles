# Build a Simple Docker Image for Microservice


Once we have some microservice implemented use the [Simple Dockerfile Example](Simple Dockerfile Example.md) to make it container ready

NOTE: It can be service in whatever language. Using go here.

Build the docker image
```sh
docker build -t mfolio-backend:0.1.0 .
```
 `-t` is for tag

Tag and push image to Docker Hub:
```sh
docker tag mfolio-backend:0.1.0 tomesm/mfolio-backend:0.1.0
```

this creates a new image (copy with the docker hub repo prefix):
```sh
docker images
REPOSITORY											TAG					IMAGE ID		CREATED			SIZE
mfolio-backend										0.1.0					cf1d77a1740c	26 minutes ago	365MB
tomesm/mfolio-backend								0.1.0					cf1d77a1740c	26 minutes ago	365MB
```

Login into docker hub:
``` sh
docker login
```
And push the image into the hub
```sh
docker push tomesm/mfolio-backend:0.1.0
```

Then continue with [Run The Containerized Microservice Locally](Run The Containerized Microservice Locally.md)
