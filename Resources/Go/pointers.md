A pointer holds the memory address of a value.
The type `*T` is a pointer to a `T` value. Its zero value is `nil`.
```
var p *int
```
The `&` operator provides an address of a variable (place in a memory). This address can be assigned as a value of the pointer:
```
i := 42
p = &i
```
The `*` operator denotes the pointer's underlying value.
```
fmt.Println(*p) // read i through the pointer p
*p = 21		 // set i through the pointer p
```
This is known as "dereferencing" or "indirecting".
- Use `*` operator in function declarations and `&` in passing the reference into function argument
	- go code block below:
	```go
		func zeroptr(iptr *int) {
			*iptr = 0
		}
		zeroptr(&i)
		```
We can print the pointer value:
- go code block below:
```go
	fmt.Println("pointer:", &i)
	```
- sh code block below:
```sh
	pointer: 0x42131100
	```
Unlike C, Go has no pointer arithmetic.