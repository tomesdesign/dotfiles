---
alias: Golang
icon: 🐹
url: https://go.dev/doc/
---


Robs book: https://rwxrob.github.io/coding-from-the-get-go/
- "Go was explicitly designed and developed to do real work, originally at Google and now for the world of "cloud-native" computing upon which all enterprise depends."
	id:: 67dd5ac8-77e1-4519-9f82-fb6f2a9ac43e
- Package is the current directory name
- All `.go` files in directory as as if they were all in a single file
- Unit test files have `_test.go` (but more on that later)
- By convention, `main.go` contains `func main()` (also `package main`)
- All packages are either *commands* or *libraries*
- Put library packages into `pkg`
- Put command packages into `cmd`
- A *module* contains one or more packages
- Keep `go.mod` (which identifies the top of the *module*) at the root
- Regularly use `go mod tidy` to remove unused module dependencies
- Commit `go.mod` and `go.sum` in your GitHub repos
- Make sure command packages have good names
- Build binaries in same directory with `go build`
- Build binary with specific name with `go build -o hello`
- Install into `GOBIN` (in `PATH`) with `go install`
- Use `type hello` to see what is being run
- Use `hash -r` to reset to latest install
- Note that `go install` required full path to file `go install ./cmd/hello`
- Go is an *explicitly* compiled language (like C)
- Comment a single line with `//`
- Comment multiple lines with `/* */`
- Create same-named file with `_test` for unit tests
- Add `// Output:` comment followed by expected output as `//` comment
- Run `go test` to check example-based unit test
- Learn basic Markdown
- Consider learning AsciiDoc

## Setup
- Installl go
	- sh code block below:
	```sh
		brew install git gh go
		```
- Authenticate to github
	- sh code block below:
	```sh
		gh auth login
		```
- Create a GitHub repo to contain your Go coding work and notes.
	- sh code block below:
	```sh
		mkdir -p ~/Repos/github.com/youraccount
		cd ~/Repos/github.com/youraccount
		gh repo create learn-golang --private --clone
		git branch -m main
		git push -u origin main
		```
- Add `GOPATH``
	- sh code block below:
	```sh
		export GOPATH=$HOME/go
		export PATH=$PATH:$GOPATH/bin
		```
		- No need to set GOROOT, it is done automatically with brew install
		- If you need it use `export GOROOT=$(go env GOROOT)`
- Initiate the module
	- This is the best practice for all projects. Always do that
	- sh code block below:
	```sh
		go mod init github.com/martin-tomes/myrepo
		```
- Configure your shell before start coding
	- run `go env`
		- `GOPROXY` should be set to `direct`
			- explanation here https://www.youtube.com/watch?v=FXm4gA3o_gk&list=PLrK9UeDMcQLpl8LzG70RQOqQWkt5i3kfD&index=2
				- 51:53
			- Much faster, no need to use proxy
		- 
			- 
## Dependencies
- Always run `go mod tidy` whenever you change dependencies
- 

## Fun facts
- The fastest compile time in history of all languages. Nothing is compile faster (even Rust).
	- Do not confuse this statement with runtime speed (where, C, rust are faster of course)
		- 37:47 https://www.youtube.com/watch?v=v7vigq_X_L0&list=PLrK9UeDMcQLpl8LzG70RQOqQWkt5i3kfD&index=6
	- **Perplexity**:
		- Google's codebase in 2007 involved thousands of engineers working on a shared, multi-language repository (C++, Java, Python). Compilation times for C++ were particularly problematic, with recursive dependency loading causing inefficiencies. For instance, importing a single library could lead to the compiler reading gigabytes of data due to header file expansion[1](https://cacm.acm.org/research/the-go-programming-language-and-environment/)[2](https://go.dev/talks/2012/splash.article)[4](https://hackernoon.com/a-programmers-history-of-golang).
		- Go was designed to be a statically compiled language with fast compilation times, reducing developer downtime and improving productivity[1](https://cacm.acm.org/research/the-go-programming-language-and-environment/)[4](https://hackernoon.com/a-programmers-history-of-golang).
		- Managing dependencies in large C++ binaries was cumbersome, as it was impractical to verify dependencies automatically. This led to bloated binaries and inefficient builds[2](https://go.dev/talks/2012/splash.article)[4](https://hackernoon.com/a-programmers-history-of-golang).
		- Go introduced rigorous dependency management and simplified build processes, enabling more efficient and scalable development[2](https://go.dev/talks/2012/splash.article).


{{namespace #go}}

