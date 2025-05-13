---
tags: [[Linux]]
---

display the system message buffer
writes the kernel messages to STDOUT
we can check boot message:
- sh code block below:
```sh
	dmesg -t | less
	```
	- NOTE: -t flag not available on (macos)
