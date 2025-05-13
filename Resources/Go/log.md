Package for logging
Provides more information:
- go code block below:
```go
	package main
	
	import (
		"fmt"
		"log"
	)
	
	func main() {
		fmt.Println("Hello friend")
		log.Println("debug: hello friend")
	}
	
	```
- Output:
	- sh code block below:
	```sh
		Hello friend
		2025/03/24 15:10:40 debug: hello friend
		```

even more advanced is package /log/slog
- https://pkg.go.dev/log/slog
The proper way to write something to STDERR
- Instead of built-in [print](print.md)
- 
NOTE: the `log.Println("debug: hello friend")` should be printed only when error occurs, weg. if err check fails. NEVER print debug logs to STDOUT, always to STDERR!!!

