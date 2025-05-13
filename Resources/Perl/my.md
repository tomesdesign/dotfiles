---
tags: #Perl/Keyword
---

This keyword	creates a local variable (variable valid only inside ablock and/or #Perl/Subroutine )
The following code assigns a copy of subroutine parameters into a local variable `@params`:
- perl code block below:
```perl
	sub echo { 
		my @params = @_; 
		print "@params\n";
	}
	```
- If we would leave the `my` keyword, the compiler would consider the variable as global.
	- With [strict](pragma/strict.md) the compiler will complain
	- 


