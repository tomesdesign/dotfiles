basic type
- not strictly atomic because it is an array of characters/runes
zero value is `""` empty string
Check [Println](Println.md)

## Basics
- Can be concatenated or joined with numeric operation results:
	- go code block below:
	```go
		package main
		
		import "fmt"
		
		func main() {
		
			fmt.Println("go" + "lang")
		
			fmt.Println("1+1 =", 1+1)
			fmt.Println("7.0/3.0 =", 7.0/3.0)
		}
		```
	- sh code block below:
	```sh
		golang
		1+1 = 2
		7.0/3.0 = 2.3333333333333335
		```
- Use backticks `` to newline the string
	- You can also excape with `\n` inside double quotes
	- 
- 

## Formatted strings (strings interpolation)
- use [Printf](Printf.md) family
- 
