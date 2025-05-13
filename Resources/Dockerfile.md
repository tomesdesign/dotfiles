file to build [Docker](Docker.md) images
Part of [Cloud Native Aplications](Cloud Native Aplications.md) workflow

## [Simple Dockerfile Example](Simple Dockerfile Example.md)
- the following **IS NOT WORKING**:
	- dockerfile code block below:
	```dockerfile
		# base docker image we will be building upon
		FROM golang:1.24-alpine
		
		# Metadata
		MAINTAINER Martin Tomes 
		
		# create a variable
		ENV SOURCES /go/src/github.com/itsmartintomes/mfolio-backend 
		
		# COPY \<src dir\> \<dest dir on the container\>
		COPY . $(SOURCES) 
		COPY go.mod go.sum $(SOURCES) 
		
		# RUN cd $(SOURCES) && CGO_ENABLED=0 go install # Go to the source directory and install the app
		RUN cd $(SOURCES) 
		RUN go mod download && CGO_ENABLED=0 go build -o mfolio-backend ./cmd/
		
		# Set default value for the port
		ENV PORT 8888 
		
		# Expose the port
		EXPOSE 8080 
		
		# Entry application/process to be run when the container starts
		# In our case its the name of the golang executable from the build
		ENTRYPOINT mfolio-backend
		```
		- Possible causes:
			- The shell in Docker does **not** expand `$(SOURCES)` in `COPY` and `RUN` as you expect.
			- Each `RUN` command starts in `/` unless you use `WORKDIR`.
			- `go.mod` and `go.sum` must be present in the directory where you run `go mod download` and `go build`
			- `ENTRYPOINT mfolio-backend` needs to be an array or the binary must be in `$PATH`.
			- sh code block below:
			```sh
				FROM golang:1.24-alpine
				
				# Set the working directory inside the container
				WORKDIR /go/src/github.com/itsmartintomes/mfolio-backend
				
				# Copy go.mod and go.sum first for better caching
				COPY go.mod go.sum ./
				
				# Download dependencies
				RUN go mod download
				
				# Copy the rest of the source code
				COPY . .
				
				# Build the application
				RUN CGO_ENABLED=0 go build -o mfolio-backend ./cmd
				
				# Expose the port (change if your app uses a different port)
				EXPOSE 8080
				
				# Set the default port as an environment variable (optional)
				ENV PORT=8888
				
				# Set the entrypoint
				ENTRYPOINT ["./mfolio-backend"]
				
				```
- example which is **working**:
	- sh code block below:
	```sh
		# base docker image we will be building upon
		FROM golang:1.24-alpine
		
		# Set the working directory inside the container
		WORKDIR /go/src/github.com/itsmartintomes/mfolio-backend
		
		# Copy go.mod and go.sum first for better caching
		COPY go.mod go.sum ./
		
		# Download dependencies
		RUN go mod download
		
		# Copy the rest of the source code
		COPY . .
		
		# Build the application
		RUN CGO_ENABLED=0 go build -o mfolio-backend ./cmd
		
		# Expose the port (change if your app uses a different port)
		EXPOSE 8080
		
		# Set the default port as an environment variable (optional)
		# Won't work if we are using PORT variable in our app and exposing different port number
		ENV PORT=8888
		
		# Set the entrypoint
		ENTRYPOINT ["./mfolio-backend"]
		
		```
	- Run `docker images` to check if the image is there
- 
- 
## [Improved Dockerfile Example](Improved Dockerfile Example.md)
- Build the executable on our dev machine and than copy the executable into a lightweight image (alpine)
	- Dockerfile code block below:
	```Dockerfile
		FROM alpine
		MAINTAINER Martin Tomes
		
		WORKDIR /app
		
		COPY ./mfolio-backend /app/mfolio-backend
		RUN chmod +x /app/mfolio-backend
		
		EXPOSE 8080
		
		ENV PORT 8080
		
		ENTRYPOINT ["./mfolio-backend"]
		```
- 
