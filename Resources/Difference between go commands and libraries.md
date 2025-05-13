---
tags: #Go
---


**Commands**:
- Are [packages]([package](Go/package.md)) that compile into executable programs.
- Usually contain a `main` package with a `main()` function.
- Reside in the `cmd/` directory by convention.
	- go code block below:
	```go
		// File: cmd/myapp/main.go
		package main
		
		import "fmt"
		
		func main() {
			fmt.Println("This is a command (executable)")
		}
		```
- When built, produce a binary that can be run directly from the shell or command line.
- Example: Look at Kubernetes - it has eg. [kubectl](kubectl.md) or [kubeadm](kubeadm.md) under `cmd`
**Libraries**:
- Are [packages]([package](Go/package.md))	intended to be imported and used by other Go programs.
- Do not contain a `main()` function.
- Reside in the `pkg/` directory by convention.
	- go code block below:
	```go
		// File: pkg/mylib/mylib.go
		package mylib
		
		func Add(a, b int) int {
		return a + b
		}
		```
- Are compiled into static or shared libraries that can be linked or imported into other applications.
- Example: Utility functions, data structures, or reusable components.
**Build Process**:
- Commands are built into binaries using `go build` in their respective `cmd/` directories.
- Libraries are compiled into packages that can be imported via `import` statements in other Go code, and are statically linked during build.
**In summary**, commands are the entry points for applications, producing executable binaries, while libraries are reusable code modules meant to be imported into other programs, facilitating code reuse and modularity.
- sh code block below:
```sh
	myproject/
	├── cmd/
	│	├── app1/
	│	│	└── main.go	# produces binary "app1"
	│	└── app2/
	│		└── main.go	# produces binary "app2"
	├── pkg/
	│	└── utils/
	│		└── utils.go	# reusable library code
	└── go.mod
	
	```