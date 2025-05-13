basic numeric type

Other types derived:
- sh code block below:
```sh
	int	int8	int16	int32	int64
	uint uint8 uint16 uint32 uint64 uintptr
	```
The `int`, `uint`, and `uintptr` types are usually 32 bits wide on 32-bit systems and 64 bits wide on 64-bit systems. When you need an integer value you should use `int` unless you have a specific reason to use a sized or unsigned integer type.
zero value for int is `0`
