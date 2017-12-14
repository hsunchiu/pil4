# Chapter4 Strings

* Creat a new string with the desired modification

```
> a = "one string"
> b = string.gsub(a,"one","another")		--change string parts
> print(a)		--> one string
> print(b)		-->	another string
```

* Get the length of string using the **length operator**(denoted by `#`)

```
> a = "hello"
> print(#a)		--> 5
> print(#"good bye")  --> 8
```
* Concatenate two string with the **contatenation operator** `..`(two dots)

```
> "hello " .. "world"		--> hello world
> "result is " .. 3			--> result is 3
```
> in python 
> 
> ```
> >>> print('hello','world')
> hello world
> 	python treats , as a char ' ' 
> ```

In lua, you have to add ' ' by youself.

* the concatenation operator will not modificate the operands

```
> a = 'hello'
> a .. ' world'
> a				--> hello world
```

## Literal strings

- We can delimit literal string by single or double matching quotes:

```
a = "a line"
b = 'another line'
```
- Strings in Lua can contain the following C-like **escape sequences**:

|	escapes				|			meanings   |
|:---------------------|:------------------|
|\a						|	bell	|
|\b|back space|
|\f|form feed|
|\n|newline|
|\r|carriage return|
|\t|horizontal tab|
|\v|vertical tab|
|\\|backslash|
|\"|double quote|
|\'|single quote|

For example

```
> print("one line\nnext line\n\"in quotes\", 'in quotes'")one linenext line"in quotes", 'in quotes'> print('a backslash inside quotes: \'\\\'')a backslash inside quotes: '\'> print("a simpler way: '\\'")a simpler way: '\'
```
- Specify a chracter in literal string by its nemberic value
	- **\ddd**,where **ddd** is a sequence of up to three decimak digits 
	- **\xhh**,where **hh** is a sequecoe of exactly two hexadecimal digits
	- UTF-8 character **\u{h... h}**
	`> '\u{3b1} \u{3b2 \u{3b3}'		-->	α β γ`
	
## Long string

 Form:
 
 ```
 long_string = [[
 <html>
 <head>
 	<title>An HTML Page</title>
 </head>
 <body>
 	<a href="http://www.lua.org">Lua</a>
 </body>
 </html>  ]]
 ```
 if the string contain **]]** in the string ,you can write the string like this:
 `[==[ .......some string ....]]]==]`
 the number of `=` in `[[` and in `]]` must be the same,so the Lua can delimit it. This rule is applied for long comment `--[[ long comment ]]`
 
 * since version 5.2 Lua offer the escape sequence **\z**
 
 ```
 data = "\x00\x01\x02\x03\x04\x05\x06\x07\z                      \x08\x09\x0A\x0B\x0C\x0D\x0E\x0F
 ```
 
 The \z at the end of the first line skips the following end-of-line and the indentation of the second line, so that the byte \x08 directly follows \x07 in the resulting string.
 
## Coercions
 
 * Lua provides automaic conversions between numbers and strings at run time
	* number to string for string operation
	`> print(10 .. 20)   ->> 1020`
	* string to number for arithmetic operation
	`> '10' + 1   --> 11.0`
	
	> any arithmetic operation with strings is handled as a floating-point operation
	
* to convert a string to a number explicitly, use **tonumber**

```
> tonumber("  -3 ")		--> -3> tonumber(" 10e4 ")	--> 100000.0> tonumber("10e")		--> nil   (not a valid number)> tonumber("0x1.3p-4") --> 0.07421875
```

By default, tonumber assumes decimal notation, but we can specify any base between 2 and 36 for the conversion:

```
> tonumber("100101", 2)			--> 37> tonumber("fff", 16)			--> 4095> tonumber("-ZZ", 36)			--> -1295> tonumber("987", 8)			--> nil
```

* To convert a number to a string, use **tostring**
`> print(tostring(10) == "10")   --> true`

for full control, please use **string.format**

* order operators never coerce their arguments.so `2 < '15'` is __valied__.

## The string Library

the string is used for encodings in one-byte character. 
it break in any Unicode encoding.And several parts of the string library are quite useful for UTF-8

* string function examples

|   funtion			| description		| usage|
|:-----------------|:-----------|--------|
|string.rep(s,n)			|return a string s repeated n times| > string.rep("s",3)    --> sss|
|string.len(s) | return the len of s | > string.len('aa')	--> 2|
|string.reverse(s)| a copy of  the string s reversed | string.reverse('abc')	--> cba|
|string.lower(s) string.upper(s)| return a copy of s upper or lober| string.lower('Aaa')	--> aaa  string.upper("aAA")	--> AAA|
|string.sub(s,i,j) |extracts a piece of the string s,form i-th th the j-th character invlusive.(The firsr character of s string has index 1)|> string.sub("[in brackets]",2,-2)  --> in brackets <br> > string.sub('[in brackets]',1,1)	-->[ <br>> string.sub('[in barackets]',-1,-1) --> ]|
|1. string.char(n) string.byte(c)  <br> 2. string.byte(s,i)<br>3.string.byte(s,i,j)|1.convert between characters and their internal numberic representations <br>2. returns the internal numberic representation of the i-th character <br>3.return multiple values with the numberic representation of all characters of all chracters between indices i and j(inclusive)  |1. > string.char(97)--> a <br>2.>print(string,char(99,100,101))	--> cde <br>3. > print(string.byte('abc',1,2))		--> 97 98 |
| string.format| like C format output `printf`| > string.format("pi = %.4f",math.pi)	--> pi = 3.1416|
|string.find(s,subs)	| search for a pattern in a given string|1. > string.find("hello world",wor)  --> 7 9 <br>2. > string.find("hello world","war")  --> nil |
|string.gsub(s,s1,s2) | (Global SUBstitution)retrun a copy of repalcing pattern s1 to s2 and how many patterns it is repalced | >string.gsub('hello world','l',',') --> he..o wor.d	3 <br>>string.gsub("hello world", "ll", "..") --> he..o world    1

OOP format call to the library:

```
s: sub(i,j) s:upper() s:lower() ...
```

## Unicode

|	function		|  description |   uasage  |
|:---------------|:-------------|:---------|
|utf8.len(s)		| get the character len of utf-8,if it find any invalid sequence,it returns false plus the positon of the first invalied byte | 1.>tf8.len("résumé")	--> 6<br> 2. >utf8.len("ação")	--> 4	<br> 3.>utf8.len("ab\x93") --> nil    3  |
| utf8.char(n1,n2,***)<br> urf8-codepoint(s,i,j)<br>| euivalent of string.char() and string.byte in the UTF-8| >utf8.char(114, 233, 115, 117, 109, 233) --> résumé<br>>utf8.codepoint("résumé", 6, 7)             --> 109    233|
|utf8.offset(s,n)| converts a character position to a byte position|<br>> s = "Nähdään"<br> > utf8.codepoint(s, utf8.offset(s, 5))    --> 228<br>> utf8.char(228)<br> > s = "ÃøÆËÐ"<br>> string.sub(s, utf8.offset(s, -2))    --> ËÐ|
|utf8.codes(s) |iterate over the characters in a UTF-8 string |<br>for i, c in utf8.codes("Ação") do<br> print(i, c)<br>end <br>--> 1    65<br>--> 2    231<br>--> 4    227<br>--> 6    111|


 


	
	
