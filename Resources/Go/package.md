A directory that has go files in it
- Even the root directory's name is the name of the package
- All `.go` files in the same directory (package) act as one single file.
	- This means code from foo1.go can call a function from foo2.go in the same directory (package)
	- #+BEGIN_CAUTION
		Except Unit test files (files ending with `_test.go`)
		#+END_CAUTION

All packages are either commands (turns into executable) or libraries (turns into binary which can be imported/statically linked by another program)
- See [Difference between go commands and libraries](../Difference between go commands and libraries.md)
- 
Any go program must have a package named `main`
- any main package must have a function called `main{}`
- Usualy (by convention) most programs code starts in `main.go` file

By convention, the package name is the same as the last element of the import path. For instance, the `"math/rand"` package comprises files that begin with the statement `package rand`.

Keep `go.mod` (which identifies the root of the [module](module.md) ) in the root folder