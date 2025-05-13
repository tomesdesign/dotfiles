A `switch` statement is a shorter way to write a sequence of `if - else` statements. It runs the first case whose value is equal to the condition expression.
Go's switch is like the one in C, C++, Java, JavaScript, and PHP, except that Switch evaluate cases from top to bottom, stopping when a case succeeds.
- go code block below:
```go
	switch i {
		case 0:
		case f():
	}
	```
	- does not call `f` if `i==0`.)
- In effect, the `break` statement that is needed at the end of each case in those languages is provided automatically in Go. Another important difference is that Go's switch cases need not be constants, and the values involved need not be integers.

```go
package main

import (
	"fmt"
	"runtime"
)

func main() {
	fmt.Print("Go runs on ")
	switch os := runtime.GOOS; os {
	case "darwin":
		fmt.Println("OS X.")
	case "linux":
		fmt.Println("Linux.")
	default:
		// freebsd, openbsd,
		// plan9, windows...
		fmt.Printf("%s.\n", os)
	}
}
```

Switch without a condition is the same as `switch true`.
- This construct can be a clean way to write long if-then-else chains:
	- go code block below:
	```go
		package main
		
		import (
			"fmt"
			"time"
		)
		
		func main() {
			t := time.Now()
			switch {
			case t.Hour() \< 12:
				fmt.Println("Good morning!")
			case t.Hour() \< 17:
				fmt.Println("Good afternoon.")
			default:
				fmt.Println("Good evening.")
			}
		}
		```
A type `switch` compares types instead of values. You can use this to discover the type of an interface value. In this example, the variable `t` will have the type corresponding to its clause.
- go code block below:
```go
	whatAmI := func(i interface{}) {
			switch t := i.(type) {
			case bool:
				fmt.Println("I'm a bool")
			case int:
				fmt.Println("I'm an int")
			default:
				fmt.Printf("Don't know type %T\n", t)
			}
		}
	whatAmI(true)
	whatAmI(1)
	whatAmI("hey")
	```
	```sh
	I'm a bool
	I'm an int
	Don't know type string
	```
