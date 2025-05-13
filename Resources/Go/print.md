There is difference between go built-in `print` and `println` functions
- #rwxrob calls them "keywords" but they are technically not.
- they write to STDERR!
and [Println](Println.md) from the `fmt` package
id:: 67e01bc9-a0f6-4b9e-ac5d-9ee6b2d62a28
- writing to STDOUT

we can use them for debugging purposes because we can redirect them to STDERR
- and delete later
- no need to use debug log functions most programmers use
- We have to know we can print to different streams: STDOUT and STDERR
- go code block below:
```go
	package main
	
	import "fmt"
	
	func main() {
		fmt.Println("Hello friend")
		println("debug: hello friend")
	}
	```
	- run this with `go run main.go` an youll get:
		- both STDOUT and STDERR is printed
		- ```
			Hello friend
			error: debug friend
			```
	- But if we want to redirect/supress the errors from STDERR to null `go run main.go 2\>/dev/null`
		- we get just the `fmt` (STDOUT) output:
		- ```
			Hello friend
			```
	- If we redirect the STDOUT to null: `go run main.go \>/dev/null`
		- we get just the STDERR message
		- ```
			debug: hello friend
			```
- NEVER print debug messages into STDOUT!! Only into STDERR
- Do not use this built-int functions, rather use [log](log.md)
- 