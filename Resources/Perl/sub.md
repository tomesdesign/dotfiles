---
alias: Perl/subroutine
---


Perl does not have "functions" but rather "subroutines"
```perl
sub echo { 
	print "@_\n";
} 
echo @ARGV
```
- #@_ is an array of subroutine paramters
- 