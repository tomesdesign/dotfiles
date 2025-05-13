---
tags: #Perl/Keyword
---


`say` is syntactic sugar for `print` with an implicit newline
Both functions handle filehandles similarly (e.g., `say STDERR "error"`)
For Perl 5.10+, `use feature 'say'`:
- perl code block below:
```perl
	use feature 'say';
	say "Hello";	# Outputs "Hello\n"
	```
For simple output, `say` reduces boilerplate code. For finer control (e.g., omitting newlines), `print` remains necessary.
For Perl 5.38+ use
- perl code block below:
```perl
	use v5.38;
	
	say "Hello";	# Outputs "Hello\n"
	```
