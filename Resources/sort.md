---
tags: [[shell]] [[Linux]]
---

Sort lines of text files.

The common case is to sort lines and use [uniq](uniq.md):
- sh code block below:
```sh
	sort path/to/file | uniq [-c|--count]
	```
	- This displays number of occurrences of each line along with that line
	- 