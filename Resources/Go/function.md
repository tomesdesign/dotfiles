# Go function

Source: A tour of go


## Arguments
A function can take zero or more arguments.

```go
	package main
	
	import "fmt"
	
	func add(x int, y int) int {
		return x + y
	}
	
	func main() {
		fmt.Println(add(42, 13))
	}
	```
The type of the [argument]([arguments](../Programming/Functions/arguments.md) comes **after** the variable name!

When two or more consecutive named function arguments share a type, you can omit the type from all but the last.

```go
		func add(x, y int) int {
			return x + y
		}
		```
 
## Multiple results

A function can return any number of results.

The `swap` function returns two strings:

```go
		package main
		
		import "fmt"
		
		func swap(x, y string) (string, string) {
			return y, x
		}
		
		func main() {
			a, b := swap("hello", "world")
			fmt.Println(a, b)
		}
		```

## Named return values

Go's return values may be named. If so, they are treated as variables defined at the top of the function.

These names should be used to document the meaning of the return values.

A `return` statement without arguments returns the named return values. This is known as a naked
return.

Naked return statements should be used only in short functions, as with the example shown here. They can harm readability in longer functions.

```go
	package main
	
	import "fmt"
	
	func split(sum int) (x, y int) {
		x = sum * 4 / 9
		y = sum - x
		return
	}
	
	func main() {
		fmt.Println(split(17))
	}
	```

## Visibility (public, private)
Why are the package functions like `fmt.Println` with initial capital?
  - 27:10 https://www.youtube.com/watch?v=v7vigq_X_L0&list=PLrK9UeDMcQLpl8LzG70RQOqQWkt5i3kfD&index=3
  -  [Ro] came with an idea that if you capitalise the initial letter, it will means the finction is exported/public scope. everyone can see it
		- no need to use supporting keywords (`export`, `public`, etc) as in other languages
	- lower case means `private` function (unless its builtin `print` functions)
	- 
