Go print functions can take generics now, so we can print both strings and whatever type it is:
- go code block below:
```go
	package main
	
	import (
		"fmt"
	)
	
	func main() {
		fmt.Println("Hello friend", 34550)
	
	}
	```
- sh code block below:
```sh
	go run main.go
	Hello friend 34550
	```
We can print every type because [Every type in Golang has its string representation](../../Every type in Golang has its string representation.md)
