The only loop cycle in Go (no `while` etc)
Unlike other languages like C, Java, or JavaScript there are no parentheses surrounding the three components of the `for` statement and the braces `{ }` are always required.


```go
package main

import "fmt"

func main() {

	// the most basic loop
	i := 1
	for i \<= 3 {
		fmt.Println(i)
		i = i + 1
	}

	// A classic initial/condition/after for loop.
	for j := 0; j \< 3; j++ {
		fmt.Println(j)
	}

	// Another way of accomplishing the basic 
	// “do this N times” iteration is range over an integer.
	for i := range 3 {
		fmt.Println("range", i)
	}

	// for without a condition will loop repeatedly until 
	// you break out of the loop or return from the enclosing function.
	for {
		fmt.Println("loop")
		break
	}

	// You can also continue to the next iteration of the loop.
	for n := range 6 {
		if n%2 == 0 {
			continue
		}
		fmt.Println(n)
	}
}
```
```go
1
2
3
0
1
2
range 0
range 1
range 2
loop
1
3
5
```
The init and post statements are optional.
- go code block below:
```go
	func main() {
		sum := 1
		for ; sum \< 1000; {
			sum += sum
		}
		fmt.Println(sum)
	}
	```
- We can omit the semicolon
- go code block below:
```go
	func main() {
		sum := 1
		for ; sum \< 1000; {
			sum += sum
		}
		fmt.Println(sum)
	}
	```
- Which effectively creates the `while`
- 