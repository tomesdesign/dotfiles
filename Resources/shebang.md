---
tags: #shell #Perl #idea/article
---


`#!`
The first line in a script telling the system which interpreter to use
specifies the paths to the executable interpreter binary. it can be eg. `#!/usr/bin/env sh` or `#!/bin/sh`
The difference between `#!/bin/sh` and `#!/usr/bin/env sh` lies in portability, flexibility, and how the Bash interpreter is located:
## Portability and Interpreter Location
`#!/bin/sh` explicitly specifies the absolute path to Bash, which is typically `/bin/sh` on Linux systems. However, this path may not exist on non-Linux systems like BSD or macOS, where Bash might be installed at `/usr/local/bin/sh` or elsewhere
`#!/usr/bin/env sh` uses the `env` command to search for `sh` in the user's `$PATH`, making it more portable across different Unix-like systems.
- This ensures the script works even if Bash is installed in a non-standard location.
## Security vs. Flexibility
`#!/bin/sh` is more secure because it locks the interpreter to a specific path, reducing the risk of unintended interpreter execution
`#!/usr/bin/env sh` is more flexible but less secure, as it relies on the `$PATH` environment variable, which could be manipulated to point to a malicious interpreter
## Additional Considerations
`#!/bin/sh` allows passing arguments directly to the interpreter (e.g., `#!/bin/sh -e`), while `#!/usr/bin/env sh` does not support this
On systems like OpenBSD, `#!/bin/sh` fails if Bash isn't installed in `/bin`, whereas `#!/usr/bin/env sh` works as long as Bash is in the `$PATH`
For tightly controlled environments (e.g., Linux-only), `#!/bin/sh` is sufficient. For cross-platform scripts, `#!/usr/bin/env sh` is preferred.

In my dotfiles I always use