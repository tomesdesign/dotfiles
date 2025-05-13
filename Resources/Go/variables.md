In Go, *variables* are explicitly declared and used by the compiler to e.g. check type-correctness of function calls.
Relates to [inference](inference.md)
Special case of variable is [const](const.md)

```go
package main

import "fmt"

func main() {
	
	// var declares 1 or more variables.
	var a = "initial"
	fmt.Println(a)

	// You can declare multiple variables at once.
	var b, c int = 1, 2
	fmt.Println(b, c)

	// Go will infer the type of initialized variables.
	var d = true
	fmt.Println(d)

	// Variables declared without a corresponding initialization are zero-valued. 
	// For example, the zero value for an int is 0.
	var e int
	fmt.Println(e)

	// The := syntax is shorthand for declaring and initializing a variable, 
	// e.g. for var f string = "apple" in this case. This syntax is only available 
	// inside functions. Because outside a function every statement begins with 
	// a keyword (var, func, and so on) and so the := construct is not available.
	f := "apple"
	fmt.Println(f)
}
```
```sh
initial
1 2
true
0
apple
```

A `var` statement can be at package or function level.
- go code block below:
```go
	package main
	
	import "fmt"
	
	//variables on package level
	var c, python, java bool
	
	func main() {
		// variable on function level
		var i int
		fmt.Println(i, c, python, java)
	}
	```
- sh code block below:
```sh
	# all printed with default values:
	0 false false false
	```

