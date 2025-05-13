---
url: https://www.redhat.com/en/blog/introduction-ed-editor
---


Attachments
- [A Tutorial Introduction to the UNIX Text Editor.pdf](../assets/A_Tutorial_Introduction_to_the_UNIX_Text_Editor_1743540170740_0.pdf){:width 300,:height 300}
- [Advanced Editing On UNIX.pdf](../assets/Advanced_Editing_On_UNIX_1743539550099_0.pdf){:width 300,:height 300}
- [GNU 'ed' Manual __ Reader View.pdf](../assets/GNU_'ed'_Manual_Reader_View_1743588482621_0.pdf){:width 300,:height 300}
- 
The standard UNIX editor
First editor made by humans to edit text on computer (via a terminal)

All text editors from VIM family are the successor of ed and ed commands works there
- And they are considered as "advanced". Many people flexing with with them on youtube without even knowing this.
- I am not flexing, I learn and use ed to proper use and know VIM
- successors:
	- [sed](sed.md) "stream ed(itor)"
	- [ex](ex.md) "extended ed"
	- [vi](vi.md) "visual ex"
	- [vim](vim.md) "vi IM proved"
	- #neovim the "new VIM"
- 

**buffer** is just a place in memory until it is written into a file
- buffer is intact after writing into the file, it remains the same
- any editing takes place in the buffer, not in the file
- NOTE: ed will print `?` if you try to `q`uit without writing. if you still want to quit, type another `q`

`P` toggles prompt symbol

`u` undo command

`.` dot, most recent line
- type `.=` to find out what the current value of dot is
- 

## Editing
- `a` append mode. this is how you modify the buffer
	- appends **after** specified **line** (or current line of no line number specified)
	- You need to end editing appending with `.`
	- `2a` start appending **after** line 2 (the line 3). the original line 3 is shifted +1 (with the rest of the lines)
	- `0a` edits at the beginning of the file
- `i` like append but insert line or lines **before** given **line**
	- need to be ended with `.`
- `33t30` copies line 33 after line 30 (making it line 31)
- `g/copy/ n` search all lines containing string "copy" and prints the lines with line numbers
	- `g/copy/`	as above just without the line number
	- `/copy` go to the first occurrence of line with string "copy" and print it and make that line as active
- `e` edits the file
	- **destructive**: fetches content the file into the buffer destroying whatever was in the buffer before
	- no need to use a file name again after wach `w`rite. Ed remembers the last file name used in `e` command
	- edit command is run by default after opening a file :
		- sh code block below:
		```sh
			ed file
			```
		- is equivalent to:
		- sh code block below:
		```sh
			ed
			e filename
			```
		- 
- `r` read the file
	- **non-destructive**: fetches content of the file and by default appends it at end of the buffer (or specified line like `5r`) keeping any other text in buffer untouched
		- this means if you do a read after edit:
		- sh code block below:
		```sh
			e junk
			r junk
			```
		- there will be two copies of the file	in the buffer now
		- NOTE: the same happens after opening the file and `r`eading it immediatley
	- can be used to `read` an output from the terminal command and insert it into the buffer:
		- sh code block below:
		```sh
			2r !date
			```
		- this place the output of the `date` command after line 2 (= on the line 3)
		- NOTE: there MUST be a hyphen between the r and !
		- it is not possible to specify a line for the inserting. this is enhancement of [ex](ex.md)
- `w` writes the buffer into the file
	- 
- `c` replaces (**change**s) line or lines with different line or lines
	- sh code block below:
	```sh
		.+1,$c
		... write something
		an simething more
		.
		```
		- this changes/replaces the whole file with a new text
		- NOTE: you must end changing with dot `.`
		- if no line number provided, ed uses dot (the current line) by default
		- it is similar (but nit exactly the same) as combination of `d` and `i`
	- `2c` go to line 2, clear the whole line and switch to the append mode on line 2
		- this changes the line 2 (completly),
		- simple `c` changes the current line
- `m` **move** line or lines around
	- it basically do `w` selected lines into a temp buffer, deletes the line and `r` the temp buffer into given line:
		- sh code block below:
		```sh
			1,3w temp
			$r temp
			1,3d
			```
	- it moves the lines in range "**after**" the target line"
		- ![image.png](../assets/image_1744708245646_0.png){:width 300,:height 300}
		- the first two lines are move after `another widget` text
		- 
- 

## Printing
- `p` is the pointer to the curernt/active line and prints it
	- NOTE: you can print any single line by typing just the line number − no need to type the letter p.
	- `,p` prints the whole buffer
	- `%p` also prints the whole buffer
		- `%` every single line in the buffer
		- `%`same function as in [vim](vim.md)
		- it is also the substitute for the current **filename** so we can pass `%` as an argument (filename) into shell commands
	- can follow almos any comman. this is useful with substitutions:
		- `s/something/somethingelse/p`
		- 
- ` ,n` prints the buffer with line nubers
	- not necessarily implemented on all versions of ed
		- eg. busybox docker image has ed without implemented `n`
- `$` "line number last line in a buffer"
	- used to printthe last line, or in range:
		- sh code block below:
		```sh
			1,$p
			```
		- prints the whole buffer (all lines)
		- 
- `f` prints the current filename
- `.+1` print the next line (or equivalently `.+1p`)
	- pressing `ENTER` is also equivalent of this
- `.-1` print the line before
- `.-3,.-1p` print previous three lines
	- `.-3,.-1` just goes to previous line
	- 

## String susbtitution
- `s/string/newstring/g` changes **all** occurences **on the same line**
	- `g` means all on the same line
		- without it only first occurrence substitutes
	- same as in [vim](vim.md)
	- most people thinks this pattern comes from [sed](sed.md) but it comes from ed actually
	- `1,2 s/string/newstring/g` does the substitute a string n a range of 1 -2 lines
	- `%s/string/newstring/g` does #Change_a_string_in_whole_file
	- `%s/string/newstring/` changes only first occurence of the string on a line in whole file
- we can delete words or characters in line:
	- `s/...//` change any first three character on line with "nothing" ( `//`= remove them )
	- remove typos:
		- sh code block below:
		```sh
			Nowxx is the time
			s/xx//p
			Now is the time
			```
- you can use different **delimiters**:
	- anything should work except blanks or tabs
	- you can get funny results using special characters
		- `^`, `.`, `$`,`[`, `*`,`\`,`&`
	- you can use this for substitiution special characters.
	- to substitute slashes you can use commas
		- `s.e.E.n`
	- this substitutes a slash with 2 slashes:
		- sh code block below:
		```sh
			s,/,//,g
			```
	- You can escape with backslashes but who wants to write this?
		- sh code block below:
		```sh
			s/\//\/\//g
			```
## Context search
- `/string of characters we want to ﬁnd/`
- same as in VIM
- it start search from `.+1` not from the beginning of the file
- we can do search and substitute all at once:
	- `/their/s/their/the/`
		- this can be shorthanded by `//` which stands for **the most recently used context search expression**
			- `/their/s//the/`
			- similar to `N` in VIM
			- we chan use `//` as a standalone command to **repeat last search** and traverse search in the whole file:
			- sh code block below:
			```sh
				2		widgEt=True widget False
				3		another widget
				```
			- sh code block below:
			```sh
				/widget/
				widgEt=True widget False
				//
				another widget
				```
- **Context search expressions are line numbers**:
	- sh code block below:
	```sh
		Now is the time
		for all good men
		to come to the iad of their party
		```
	- all of these searches points to line 2:
	- sh code block below:
	```sh
		/Now/+1
		/good/
		/party/-1
		```
	- so the make on change 2 we can do eg.:
		- `/Now/+1s/good/bad`
- use `?` to reverse search (upwards)
	- `?text?`
	- use `??` for repeating



## Formating
- **Save the current buffer to the file**:
	- ```
		text
		
		w
		```
		- This writes the current buffer back to the file it was loaded from.
- **Run `gofmt` on the file**:
	- ```
		text
		
		!gofmt -w %
		```
		- The `%` symbol refers to the current filename in most shells (like `bash`), so this runs `gofmt` on the file associated with the buffer.
		- The `-w` flag tells `gofmt` to overwrite the file in place.
- **Reload the formatted file into the buffer**:
	- ```
		text
		
		e
		```
		- This re-reads the file into the buffer, replacing its contents with the formatted version.
## goimports
- Similar as formatting
- **Save the buffer**:
	- ```
		text
		
		w
		```
- **Run `goimports`**:
	- ```
		text
		
		!goimports -w %
		```
		- `%` refers to the current file in most shells
- **Reload the formatted file**:
	- ```
		text
		
		e
		```
## Operating on files
- ed can operate on files from command line but this is very painfull
- thats why [sed](sed.md) was invented:
	- sh code block below:
	```sh
		printf "r edfile\n,n\n1,2 s/e/E/g\n,n\nw\n" | ed
		```
		- with printf we send to ed the following command (this si what we would type directly in ed):
			- read file `edfile`
			- enter (the newline `\n`)
			- print the whole file with line numbers
			- enter
			- in range of lines 1 to 2 (on lines 1 and 2) substitute all lower case `e` with upper case `E`
			- enter
			- print the changed buffer with line numbers
			- enter
			- write the buffer into the file
			- enter
		- This one line string can be written into a file and sent to the ed:
			- sh code block below:
			```sh
				r edfile
				,.
				1,2 s/e/E/g
				w
				```
				- sh code block below:
				```sh
					ed \< edscript \>/dev/null
					```
				- this means that #ed_is_not_only_editor__but_also_a_scripting_language
				- 
				- ed is and command line interface program. not a visual #TUI
