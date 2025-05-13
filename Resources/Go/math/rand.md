Generates random number
```go
package main

import (
	"fmt"
	"math/rand"
)

func main() {
	fmt.Println("My favorite number is", rand.Intn(1000))
}
```
- Intn returns, as an int, a non-negative pseudo-random number in the half-open interval [0,n)
	- This means:
		- The minimum possible return value is 0
		- The maximum possible return value is n-1
