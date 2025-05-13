---
url: https://regexlearn.com/
---


## Definition
- Regular Expressions are a string of characters that express a search pattern. Often abbreviated as `Regex` or `Regexp`. It is especially used to find or replace words in texts. In addition, we can test whether a text complies with the **rules** we set.
## Basic Matchers
- Direct typing the word or character
- Similar to normal search
- Matching the word "curious"
- #+BEGIN_QUOTE
	“I have no special talents. I am only passionately `curious`.”
	
	― Albert Einstein
	#+END_QUOTE
	- ```
		/curious/g
		```
## Dot `.`: Any Character
- Selects any character, including specials and spaces
- ![image.png](../assets/image_1742478968720_0.png){:width 300,:height 300}
- `/.../` selects first 3 characters
	- ![image.png](../assets/image_1744624597243_0.png){:width 300, :height 291}
	- 
## Character Sets `[abc]`
- square brackets
- Matches/filters any characters in a word
- ![image.png](../assets/image_1742479131760_0.png){:width 300,:height 300}
- ![image.png](../assets/image_1742479159645_0.png){:width 300,:height 300}
- 
- Square brackets define a *character set*. They match **any single character** within the set.
	- Thats why this is not working: /R[eg]ular/ to match word "Regular"
		- `[eg]` matches **either `e` or `g`**, but not the sequence `eg`.
## Negated Character Sets	[\^abc]
- To find all words in the text below, except for `ber` and `bor`, type `e` and o` ` side by side after the caret `^` character inside square brackets `[]`
	- ![image.png](../assets/image_1744625366366_0.png){:width 300,:height 300}
	- 