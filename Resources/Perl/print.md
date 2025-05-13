---
url: https://en.wikibooks.org/wiki/Perl_Programming/Keywords/print
tags: #Perl/Keyword
---


`print` itself prints a string without a newline character
- perl code block below:
```perl
	print @ARGV;	
	```
	- output:
		- ```
			./pecho command line arguments
			commandlinearguments%	 
			```
		- no spaces no new line

```perl
print "@ARGV\n";
```
- output is:
	- ```➜ ./pecho dfsdfsdf fdsfsdf sdfsdf sfsdgrthrth
		./pecho command line arguments
		command line arguments
		```
- the argument is not a string but rather an expression which evaluates into string
	- 
		- 
		- 
	- the vlaue evaluation depends on context
	- In this case in double quotes the array variable is in interpolative context
		- in which the elements of the array are joined by a separator defined in builtin variable `$"`
			- The default of `$"` is space