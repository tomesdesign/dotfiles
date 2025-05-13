**s**tream **ed**itor
Sed is a version of [ed](ed.md) operating on files
because sed is ed and vim is ed, everything what you can do with sed is built-in any vim session
- 1:51:02 https://www.youtube.com/watch?v=3xcBlioFXA8&list=PLrK9UeDMcQLqt2v0buCtrxFu2ZsOlineX&index=10
- 

This ed command:
- sh code block below:
```sh
	printf "r edfile\n,n\n%s/e/E/g\n,n\nw\n" | ed
	```
- can be simply done in sed:
	- sh code block below:
	```sh
		sed s/e/E/g filename
		```
	- and thats it!
	- NOTE: we don't have to specify `%`, sed uatomatically applies the regex line by line in the whole file
- By default sed is just prints the changes, not writing them into th file
	- which is a good practice. first see the changes than write it!!
- we can write the changes to a file only with specifying a suffix for a backup file:
	- sh code block below:
	```sh
		sed -i.bak 's/Q/q/g' sorted
		or
		sed -i .bak 's/Q/q/g' sorted
		
		ls
		sorted
		sorted.bak
		```
	- NOTE: the quotes for the regex seem to be optional
	- NOTE: on BSD UNIX (macOS) you got error if you use just the `-i` flag without suffix
		- if you want to write directly, just provide empty string:
			- sh code block below:
			```sh
				sed -i '' 's/Q/q/g' sorted
				```
	- see the Perl [alternative]([Perl replace all occurrences of of string with other string in a file](Perl replace all occurrences of of string with other string in a file.md))
	- 
With sed we can #Change_a_string_in_multiple_files
Sed allows to specify which exact occurrence on a line to substitute:
- This changes only the second q to Q on a line
- sh code block below:
```sh
	sed 's/q/Q/2' foo
	```

## Multiple substitutions
- you can pipe multiple commands but who would do that?
- you can use semicolon instead:
	- sh code block below:
	```sh
		sed 's/a/A/g; s/qqq/QQQ/g' foo
		```
	- You MUST put it between the quotes!! Not optional for this case
	- 
## Escaping
- to substitute slashes use something else as elimiter
	- this substitutes a slash with 2 slashes:
		- sh code block below:
		```sh
			sed 's,/,//,g' foo
			```
		- sh code block below:
		```sh
			sed 's:/://:g' foo		
			```
		- same as in [ed](ed.md)
- 
## Grouping regex
- create a group with parentheses
- all numbers are group 1 and they are prepended with hashtag:
	- sh code block below:
	```sh
		sed -E 's/([0-9])/#\1/' foo
		```
	- don't forget `-E` for Extended regex
- 