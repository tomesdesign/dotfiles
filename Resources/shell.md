---
alias: POSIX shell
tags: #SysAdmin [[Linux]]
---

This is not about BASH but POSIX shell
- Why? Because POSIX shell runs everywhere, it is the most universal scripting shell interpreter
This is both about terminal and shell scripting (because there is no difference between those two)
Following #rwxrob
- https://www.youtube.com/watch?v=mgeKcAPuK7c&list=PLrK9UeDMcQLre1yPasCnuKvWvyXKzmKhW&index=16
- https://www.grymoire.com/Unix/Sh.html#toc_Table_of_Contents


## Basics/concepts
- [See which shell you are running](See which shell you are running.md)
- [How to change default shell](How to change default shell.md)
- 
- Shell is Interface between human and computer (operating system)
	- shell = layer = interface
	- By convention it is a user program that is #ASCII based.
	- Allows user to specify operation in a sequence
		- Shell (or any other) interpreter translates human-readable commands into machine instructions.
- 4 important concepts:
	- user interacts with the system via shell
	- sequence of operations can be automated(scripted) in a file
	- shell is also a full featured programming language (variables, conditionals... ) whic can be used to create new programs
	- the new shell programs are first-class citizens with all privileges as any other UNIX program
		- we can replace a C program with shell script
		- we can replace a built-in UNIX utility (c binary) with our shell version, eg. we can create a program called `DIR`:
			- sh code block below:
			```sh
				#!/bin/sh
				ls $*
				```
				- shell will do the hard work
		- It is [encouraged](https://www.grymoire.com/Unix/Sh.html#toc_Table_of_Contents) to use shell as top level program
			- [UNIX philosophy](UNIX philosophy.md) is to start with a shell script? If the end results has all of the functionality, and is fast enough, then you are done.
				- If it isn't fast enough, consider replacing part (or all) of the script with a program written in a different language (e.g. C, Perl, Python).
			- [Just because a UNIX program is a shell script does not mean it isn't a real program](Just because a UNIX program is a shell script does not mean it isn't a real program.md)
			- 
- [shebang](shebang.md)
- 
- [Entering commands into command line one by one is already coding](Entering commands into command line one by one is already coding.md)
	- And shell scripting is essentially writing terminal commands in a file
- #The_distinction_between_commands__functions__and_procedures_is_often_lost_in_modern_programming.
- Shell is not allowing you to return a specific value from a function, only 0 or integer
	- ![image.png](../assets/image_1742997325515_0.png){:width 300,:height 300}

## Running scripts
- Scripts need to be in a directory listed in `$PATH` to run by name.
	- `/usr/local/bin`
- Permissions matter—scripts need `chmod +x` to be executable.
- adding the current directory (`.`) to `$PATH` can be risky.
	- If a malicious script is placed earlier in `$PATH`, it could override system commands.

## which vs type vs command #idea/article
- 25:38 https://www.youtube.com/watch?v=J5RhNFH3x1o
- `which` tells you WHERE a thing is located
	- always return path to the executable
	- it never tells you what the searched term is
	- #+BEGIN_WARNING
		This is not true in zsh where `which` behaves as type
		#+END_WARNING
		- The original `which` is located `/usr/bin/which` in my system
		- in zsh `which` is equivalent of the zsh built-in `whence -p`
	- which is non standard (not POSIX?) according to this article
		- https://stackoverflow.com/questions/14196061/different-behavior-of-which-command-in-zsh-and-bash
- `type` gives you ... TYPE of the thing
	- meaning, it tells you WHAT the searched thing is. eg. if it is aliased
- `command` forces the shell to execute the program and ignore any functions, builtins and aliases with the same name.
	- `command -v` behaves same as `type`
		- sh code block below:
		```sh
			command -v ls
			alias ls='eza -lla --group-directories-first'
			
			type ls
			ls is an alias for eza -lla --group-directories-first
			```
	- unaliased running can be achieved also with `\`
		- sh code block below:
		```sh
			\ls
			README.md		cmd			 go.mod
			```
- Purpose of this commands in scripting is to check if I have the particular command
	- sh code block below:
	```sh
		# ---------------------- local utility functions --------------------- 
		
		_have() { type "$1" &\>/dev/null; }
		_source_if() { #_-r_"$1"_ && source "$1"; }
		
		_have "vim" && set-editor vi
		_have "nvim" && set-editor nvim
		
		if _have tmux && #_-n_"$TMUX"_; then
				tmux rename-window "$(wd)"
			fi
		```

## Job Controls and Background processes
- a **running** program is a `Process`
	- use `pgrep`, `ps`, `/proc` to see processes
- a **backgrounded** program is a `Job`
	- most people do not need background (or send a process to background)
		- switching bg/fg was invented before **tmux** for exactly same reason (rwxrob told that)
			- meaning, people wanted to switch quickly to other context, do things and come back in one terminal window
	- use command [jobs](jobs.md) to **see** all background proceesses
	- use `ctrl+z` to **send** a running process to a background
	- use `fg` to bring background job forward
	- use `&` to start program in background and prints the job ID
	- `bg` resumes suspended jobs (e.g. using `ctrl-z`), and keeps them running in the background.
- use `crontab` to **schedule** processes
- 

## #Programming/State
- Actions (functions, algorithms etc) effects state
- State is the being of the program
	- the binary data (on/off) stored in memory at the given time
- If we type `echo "hello"` we put state "hello" into function echo which prints it and we can see the state of the computer by our eyes
	- from the other side, via keyboard we can transfer state of our brain into computer which stores it
	- #Our_brain_is_a_state_machine
	- [Computer science is about understanding our world and capturing it in a way that can be organised and manipulated](Computer science is about understanding our world and capturing it in a way that can be organised and manipulated.md)
	- 
- Computers are machines for storing states (in memory)
- If we do `ls` command:
	- sh code block below:
	```sh
		ls
		.rw-r--r--@ 107 martin 26 Mar 14:18 nostr.json
		```
	- We see a file which represents a state (some data in memory)
- 
## #shell/string
- a string `hello` is a state (some bytes in memory, ones and zeros)
	- it's array of characters
	- emojis are other bytes/state
- Everything in shell should be treated as a string and you'll be save.
	- wrap everything into string
	- string is the main type
	- shall was meant to handle strings (commands)
	- always use `shellcheck`
	- do:
		- sh code block below:
		```sh
			name="Rob"
			echo "$name"
			# NOT echo $name !!!
			
			age=23
			echo "$age"
			```
		- this prevents [globbing](shell/globbing.md) (prevents to get hacked)
			- #Why_double_quotes_prevent_globbing_issues? #idea/article
				- 
				- 
				- 