---
alias: Value interpolation
---

Programming languages can get a value from a variable in a print statement
```perl
#!/usr/bin/env perl

use strict;
use feature 'say';

my $global = 42;

sub echo {
my @params = @_;
say "@params[1] $global";
}

echo("My", "param");

```
```sh
param 42
```