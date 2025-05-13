An ordered collection of [scalars]([scalar](scalar.md))
Syntax is `@variable`:
- perl code block below:
```perl
	print @ARGV	
	```
	- The `@` symbols indicate the array.
	- [ARGV](Perl/ARGV.md) is a built-in variable
If you misspell the name of a variable, eg. `@ARG` Perl creates a new variable with an empty list as default value and the program runs without any error.
- We usually do not want this kind of behaviour
- That's why always use [strict](pragma/strict.md) to change the behaviour of the compiler
	- perl code block below:
	```perl
		#!/usr/bin/env perl
		use strict;
		
		print "@ARG\n";
		
		```

[[Functions]]

	- Now the compiler complains:
	- ```
		Global symbol "@ARG" requires explicit package name (did you forget to declare "my @ARG"?) at ./pecho line 5.
		Execution of ./pecho aborted due to compilation errors.
		```
The elements of an array are type of [scalar](scalar.md), thus numbers of strings
- Thus, if we want to assign them we need to assign them as a scalar to scalar:
	- perl code block below:
	```perl
		my $word = $params[0]; 
		print "$word\n";
		```
	- NOT:
		- perl code block below:
		```perl
			# the following statement is wrong 
			my $word = @params[0];
			```
			- this will compile and ruins but it's not correct and can cause problem
			- thats why we want to always use [warnings](pragma/warnings.md)
			- 
## Slice
- You can get more than one element at a time from an array by putting a list of indices in brackets.
- The following program creates an array variable named `@words` and assigns to it a new array that contains elements 0 and 2 from `@params`
	- perl code block below:
	```perl
		my @words = @params[0, 2]; 
		print "@words\n";
		```
	- the new array is called **slice**. But Perl slice is different from Python slices or #Go/slice
	- 
