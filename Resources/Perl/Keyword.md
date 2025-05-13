In Perl, **keywords** are reserved words that have special meaning in the language syntax. They are used for control flow, variable declarations, operators, and other core functionality. Below is a categorized list of Perl keywords:
## 1. Variable Declarations & Scoping
- `my` – Lexical (block-scoped) variable declaration
- `our` – Package-global variable declaration
- `local` – Temporarily overrides a global variable
- `state` – Persistent lexical variable (since Perl 5.10)
## 2. Control Flow & Loops
- `if`, `elsif`, `else` – Conditional execution
- `unless` – Opposite of `if` (executes if condition is false)
- `while` – Loop while condition is true
- `until` – Loop until condition is true
- `for` – C-style loop (`for (init; test; incr)`)
- `foreach` – Iterate over a list (`foreach my $x (@list)`)
- `do` – Executes a block and returns the last expression
- `next` – Skip to the next iteration (like `continue` in C)
- `last` – Exit a loop (like `break` in C)
- `redo` – Restart the current iteration without reevaluating the condition
## 3. Subroutines & Functions
- `sub` – Define a subroutine
- `return` – Exit a subroutine (optionally with a value)
- `goto` – Jump to a label (rarely used)
## 4. I/O & File Handling
- `print` – Output text (no newline by default)
- `say` – Like `print`, but adds a newline (since Perl 5.10)
- `open` – Open a filehandle
- `close` – Close a filehandle
- `read` – Read data from a filehandle
- `write` – Write formatted output (used with formats)
## 5. Regular Expressions & Matching
- `m//` (or just `//`) – Match operator
- `s///` – Substitution operator
- `tr///` (or `y///`) – Transliteration (character replacement)
- `qr//` – Compile a regex pattern for reuse
## 6. Special Operators & Functions
- `defined` – Checks if a variable has a defined value
- `undef` – Undefines a variable
- `exists` – Checks if a hash key exists
- `delete` – Removes a hash key
- `eval` – Executes Perl code dynamically (for error handling or runtime evaluation)
## 7. Modules & Packages
- `package` – Declares a namespace
- `use` – Loads a module at compile time
- `require` – Loads a module at runtime
- `no` – Removes a pragma (e.g., `no strict;`)
## 8. Exception Handling & Debugging
- `die` – Exits with an error message
- `warn` – Issues a warning without exiting
- `exit` – Terminates the program
- `caller` – Gets info about the calling subroutine
## 9. Special Variables & Context
- `wantarray` – Checks if a subroutine was called in list/scalar context
- `scalar` – Forces scalar context
- `__FILE__`, `__LINE__`, `__PACKAGE__` – Special constants for debugging
## Notes:
- Some Perl keywords (like `say`, `state`, `given/when`) require `use feature ':5.XX'` (e.g., `use feature 'say'` for Perl 5.10+).
- Perl allows sigil-based variables (`$`, `@`, `%`) but they are not keywords.
- Some built-in functions (`chomp`, `split`, `map`, `grep`) are often used like keywords but are technically functions.
