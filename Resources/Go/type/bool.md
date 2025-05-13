basic type
Standard bools like in C or any other language

```go
package main

import "fmt"

func main() {
	fmt.Println(true && false)
	fmt.Println(true || false)
	fmt.Println(!true)
}
```
```sh
false
true
false
```

Zero value for bool is `false`
