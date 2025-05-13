Similar as in C: https://www.golinuxcloud.com/golang-string-interpolation/
Default value is displayed as : `%v`
- We can change this and force to print unicode value of an emoji and vice versa or print bytes :
	- go code block below:
	```go
		fmt.Printf("%U\n", '🌍')
		fmt.Printf("%s\n", "\U0001F30D")
		fmt.Printf("%b\n", []byte("Hello"))
		fmt.Printf("%v\n", []byte("Hello"))
		```
	- sh code block below:
	```sh
		U+1F30D
		🌍
		[1001000 1100101 1101100 1101100 1101111]
		[72 101 108 108 111]
		```

