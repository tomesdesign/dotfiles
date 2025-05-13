sucessor of [ed](ed.md)
"extended ed"
not all commands are backward compatible:
- `,p` just prints the last line
- `n` is not here because ex prints the line number s automaticaly

**improvements**:
- line numbers automatically
- accepts output from shell commands:
	- sh code block below:
	```sh
		.!date
		```
	- inserts the output from `date` command on the current line (represented by the dot `.`)
	- sh code block below:
	```sh
		3!date
		```
	- inserts the output from `date` command on line 3
- this means we can rewrite the whole buffer (unlike in ed)
	- sh code block below:
	```sh
		:%!gofmt %
		```
- has full-screen visual mode called [vi](vi.md)
	- #Ex_and_vi_are_the_same_program
	- 
- has prompt `:` like the VIM command mode
- supports saving configuration into `.exrc` file

- 