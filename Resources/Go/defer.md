A defer statement defers the execution of a function until the surrounding function returns.
`defer` is often used where e.g. `ensure` and `finally` would be used in other languages.
The deferred call's arguments are evaluated immediately, but the function call is not executed until the surrounding function returns.
- go code block below:
```go
	package main
	
	import "fmt"
	
	func main() {
		defer fmt.Println("world")
	
		fmt.Println("hello")
	}
	```
- sh code block below:
```sh
	hello
	world
	```
Deferred function calls are pushed onto a stack. When a function returns, its deferred calls are executed in last-in-first-out order.
- go code block below:
```go
	package main
	
	import "fmt"
	
	func main() {
		fmt.Println("counting")
	
		for i := 0; i \< 10; i++ {
			defer fmt.Println(i)
		}
	
		fmt.Println("done")
	}
	```
- sh code block below:
```sh
	counting
	done
	9
	8
	7
	6
	5
	4
	3
	2
	1
	0
	```
- To learn more about defer statements read this [blog post](https://go.dev/blog/defer-panic-and-recover).
Practical example: reading files
- go code block below:
```go
	package main
	
	import (
		"fmt"
		"os"
	)
	
	func main() {
	
		f := createFile("/tmp/defer.txt")
		defer closeFile(f)
		writeFile(f)
	}
	
	func createFile(p string) *os.File {
		fmt.Println("creating")
		f, err := os.Create(p)
		if err != nil {
			panic(err)
		}
		return f
	}
	
	func writeFile(f *os.File) {
		fmt.Println("writing")
		fmt.Fprintln(f, "data")
	}
	
	func closeFile(f *os.File) {
		fmt.Println("closing")
		err := f.Close()
	
		if err != nil {
			panic(err)
		}
	}
	```
- sh code block below:
```sh
	creating
	writing
	closing
	```
