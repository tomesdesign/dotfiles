---
tags: #shell
---


## Word Splitting and Globbing
- Unquoted variables undergo word splitting (divided by spaces/tabs) and globbing (wildcard expansion). This can break scripts or expose them to manipulation if variables contain special characters like `*` or spaces
- sh code block below:
```sh
	name="file *"	# Contains a glob character
	echo $name		# Expands to all files in the directory (unintended)
	echo "$name"	# Outputs literally: "file *"
	```
## Security Risks
- If a script processes user input without quoting, an attacker could inject glob patterns to access unintended files or disrupt execution
- sh code block below:
```sh
	rm -rf $user_input	# Dangerous if user_input is "*"
	rm -rf "$user_input" # Safe (literal expansion)
	```
## Consistency
- Double quotes preserve literal values of all characters except `$`,	```` , `"`, `\`, and `!` (when history expansion is enabled). This ensures variables and commands behave predictably.
## Best Practices
- **Quote all expansions**: Variables (`"$var"`), command substitutions (`"$(cmd)"`), and arithmetic expansions (`"$"`)
- **Disable globbing when unnecessary**: Use `set -f` or `shopt -s nullglob` to avoid accidental expansions
- **Use arrays for lists**: `"${array[@]}"` safely preserves elements with spaces/globs
Example from ShellCheck (a linting tool):
- sh code block below:
```sh
	echo $1		# Bad: splits and globs input
	echo "$1"	# Good: preserves input exactly[10]
	```
Globbing is powerful but dangerous when combined with unquoted variables. Proper quoting is a fundamental safeguard in shell scripting.