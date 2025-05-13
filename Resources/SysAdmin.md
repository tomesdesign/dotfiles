
Based on:
- UNIX ad IDE:
	- https://blog.sanctum.geek.nz/series/unix-as-ide/
- CS615 System Administration course
	- https://stevens.netmeister.org/615/
- Skillstack Boost
	- https://www.youtube.com/watch?v=SPoqW1CMEhY&list=PLrK9UeDMcQLqt2v0buCtrxFu2ZsOlineX&index=
- 
## UNIX history and basics
### The Job of a System Administrator
	- SysAdmins brings order to chaos
	- Often work in datacenetrs or server rooms
	- Sysadmin just "makes things run"
	- Nowadays can take care also for containers. Making him [Devops](Devops.md) engineer?
	- Sysadmin connects things (cables, networking)
		- switches
		- routers
		- racks
	- SysAdmins DO type lots of code and typing in general
	- Spends lots of time in command line
	- Not only using the Internet, they are building it
	- So, System Administrators are involved in building, supporting, and maintaining just about every piece of the puzzle above
	- It is good to understand just how much power your systems draw, which systems have a higher priority to bring back online
	- Perl as the duct tape of the internet :)
	- Brain is your main tool
	- This profession requires a lot of ingenuity (vynalezavost, duvtip) and curiosity.
	- In sum:
		- There can not be a precise/uniform job description
		- No uniform career path
		- Work behind scenes (until shit happens)
		- this role can have other names:
			- IT Support
			- Operator
			- Network Administrator
			- System
				Programmer
			- System Manager
			- Service Engineer
			- Site Reliability Engineer
			- or any other variation thereof.
			- In recent years often reffered as Devops or SRE
				- What's "DevOps" in one organization is "SysAdmin" in another, and an SRE may perform the same or completely different tasks depending on the company.
			- The role definition also differs based on company's size
			- 
		- Primary job function is to manage computer and network systems for an employer or client
			- Managing your own network doesnt not make you a sysadmin (bit it is a good practice though)
		- Computering is a people problem
			- A sysadmin is solving people's problems by computering harder
			- That's why sysadmins should work with other people
			- The end goal remains to solve people problems, to manage the resources and systems you're in charge of on behalf of the organization and the public interest in mind.
				- And that, then, is the job of the System Administrator
		- 
- ### Core principles and rules
	- #### Scalability
		- Handling the overload of a small web server with sudden increase of traffic.
		- You need to *scale-up*:
			- **Vertical scale:**
				- Get a beefier hardware (meaning better CPU, RAM...)
					- Pricy
					- Not really a solution
				- "Get a stronger/bigger horse"
			- **Horizontal scale:**
				- Add more cheaper servers and distribute the load
				- But it's not as easy as vertical scale, you are adding complexity:
					- you need to add a load balancer
					- you need to do healthcheck now
				- "Get more horses than one"
			- We can combine both approaches
		- You	should also be able to *scale-down*
		- Scalability is about overall flexibility
		- In [Cloud](Cloud.md) it's called #Elasticity
		- 
	- #### Security
		- Should be built into the system from the design phase, not added later.
		- Treating security as an afterthought can lead to restrictions or workarounds that users may bypass.
		- Start with asecure, restricted state and add functionality without compromising safety.
		- Includes aspects like cryptography, physical security, service availability, and social engineering.
		- 
	- #### Simplicity
		- Essential for enabling both scalability and security.
		- Reduces complexity, ambiguity, and increases flexibility.
		- Must be inherent in the system architecture; cannot be added later.
		- Follows the KISS principle: Keep It Simple, Stupid.
		- Follow [UNIX philosophy](UNIX philosophy.md)
			- Allows for building complex systems from simple, well-structured components.
			- Use building blocks
	- #### #Second_Law_of_Thermodynamics
		- States that the entropy of an enclosed system increases over time.
		- In system administration, this means systems naturally move towards greater disorder.
		- As systems run longer, they are more prone to issues like memory leaks, hardware failures, and running out of resources.
		- Encourages preparation for these eventualities to maintain robust systems.
	- #### #Sturgeon's_Law
		- States that "90% of everything is crap," implying that most works in any field are of low quality.
		- Encourages setting realistic expectations and being discerning when evaluating quality.
		- Applies broadly across domains, from literature to consumer products.
		- Suggests that only a small fraction of works are truly valuable or high-quality.
	- #### #Causality
		- For every effect, there must be a cause.
		- Systems don't just break without a reason; there is always an underlying cause for malfunctions.
		- Understanding causality is crucial for identifying and addressing the root causes of problems.
		- Helps system administrators troubleshoot effectively by focusing on the reasons behind system failures.
	- 
- ### [History of UNIX](History of UNIX.md)
- ### Setting #AWS cli
- 
- 
Storage models and disks

Filesystem basics and software types
- [ls](ls.md)
SW installation concepts and multi-user basics

Networking
- [nmap](nmap.md)
- 
DNS, HTTP

HTTPS, SMTP

Writing system tools

Monitoring, backup, disaster recovery

Configuration management

System security

Ethics and social responsibility

## Processes
- When creating a subprocess in [shell](shell.md) via `|` the child process inherits all the variables
	- https://www.youtube.com/watch?v=gUoVdoJWG6s
		- 4:46





## Sources
- https://www.youtube.com/watch?v=QJL5cNv9dJs&list=PLDadzdouM0VBq9HdgalQkqFKvM7uSaj9L
- https://naucse.python.cz/2024/brno-linuxadmin-jaro/
- https://blog.sanctum.geek.nz/series/unix-as-ide/
- 