the expression need not be surrounded by parentheses `( )` but the braces `{ }` are required.
#+BEGIN_IMPORTANT
There is no ternary operator in Go
#+END_IMPORTANT


```go
package main

import "fmt"

func pow(x, n, lim float64) float64 {

	// A statement can precede conditionals;
	if v := math.Pow(x, n); v \< lim {
		return v
	}

func main() {

	if 7%2 == 0 {
		fmt.Println("7 is even")
	} else {
		fmt.Println("7 is odd")
	}

	if 8%4 == 0 {
		fmt.Println("8 is divisible by 4")
	}

	if 8%2 == 0 || 7%2 == 0 {
		fmt.Println("either 8 or 7 are even")
	}

	// A statement can precede conditionals; any variables 
	// declared in this statement are available in the current 
	// and all subsequent branches.
	if num := 9; num \< 0 {
		fmt.Println(num, "is negative")
	} else if num \< 10 {
		fmt.Println(num, "has 1 digit")
	} else {
		fmt.Println(num, "has multiple digits")
	}

	
	return lim
}
}
```