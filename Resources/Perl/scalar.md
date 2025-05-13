Built-in data type which Perl treats as a single unit
- a number
- a string
Always start with a dollar `$` sign:
- perl code block below:
```perl
	my $word = $params[0]; 
	print "$word\n";
	```
We can print multiple scalar variables in one print statement. It gets automatically [interpolated]([Interpolation](../Programming/Interpolation.md))
- 