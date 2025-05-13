---
tags: [[CNA]] [[Docker]] [[Dockerfile]] [[Go]]
---

Use [Improved Dockerfile Example](Improved Dockerfile Example.md)
Now cross-compile the app into linux binary
- sh code block below:
```sh
	GOOS=linux GOARCH=amd64 go build -o mfolio-backend ./cmd/
	```
And build the new version:
- sh code block below:
```sh
	docker build -t tomesm/mfolio-backend:0.1.4-alpine .
	```
Than [Run The Containerized Microservice Locally](Run The Containerized Microservice Locally.md)

