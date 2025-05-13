---
tags: [[one-liner]], [[Perl]]
---

```sh
perl -pi -e 's/string/otherstring/g' filename
```
- `perl`: Invokes the Perl interpreter
- `-p`: Creates an implicit loop that reads the input file line by line and automatically prints each line after processing
- `-i`: Enables in-place file editing (modifies the file directly)
- `-e`: Allows executing Perl code directly from the command line
- `'s/bash/sh/g'`: The Perl substitution command where:
	- `s/` starts the substitution
	- `bash` is the search pattern
	- `sh` is the replacement text
	- `g` makes the replacement global (all occurrences on each line)
- `filename`: The file to process