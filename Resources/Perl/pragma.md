A module that controls behaviour of Perl's compiler.
Now instead of
- perl code block below:
```perl
	use strict;
	use warnings;
	```
- we can just use:
	- perl code block below:
	```perl
		use v5.38;
		```
	- It gives you both pragmas for FREE
		- together with `use feature 'say'` - it will give you [say](say.md) for free
		- 
