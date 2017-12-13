# Chapter3 Numbers

## Numerals
We can write numeric constannts with an optinal decimal part plus an optional decimal exponent 

```
> 4			--> 4
> 0.4		--> 0.4
> 4.57e-3	--> 0.00457
> 0.3e12	--> 300000000000.0
> 5E+20	--> 5e+20
```
Both integer and float value have type **"number"**  

```
> type(3)			--> number
> type(3.5)		--> number
```
If you want to get the subtype, please use **math.type()**

```
> math.type(3) 			--> integer
> math.type(3.0) 		--> float
> math.type(10e5)		--> float
> math.type("hello,world")  --> nil
```
Because they have the some type,they could be compared

```
> 1 == 1.0		--> true
> 0.2e3 == 300	--> true
```

Moreover,Lua 5.3 shows them differently:  

```
> 3		--> 3
> 3.0	--> 3.0
> 1000	--> 1000
> 1e3	--> 1000.0
```
**So I think integer is stored as an integer,float and sxponent is stored as an float**

Lua supports floating-point	hexadecimal constants,which can have a fractional part and a binary exponent,prefixed by p or p2(it means p^2):

```
> 0xff			--> 255
> 0x1A3			--> 419
> 0x0.2			--> 0.125	  (1/16 * 2 equals 0.125)
> 0x1p-1			--> 0.5	  (1 * 2 ^ -1 equals 0.5)
> 0xa.bp2			--> 42.75	  (0xa.b equals 10.6875,and * 4 equals 42.75)
```
Lua can write numbers in this format using **string.format** with **%a** option:  

```
> string.format("%a",419)			--> 0x1.a3p+8
> string.format("%a",0.1)			--> 0x1.999999999999ap-4
```

## Arithmatic Operators

Lua arithmatic operator:  

* addtion			__+__
* subtraction		__-__
* multiplication	__*__
* divison			__/__
* negation(unary minus) __-__
* floor divison	__//__
* modulo		__%__
* exponentiation __^__

### Closed operators : addtion,subtraction,multiplication,negation

```
> 13 + 15		--> 28
> 13 + 1.5e1	--> 28.0
> 13 - 15.0	--> -2.0
> -(3 * 6.0)	--> -18.0
```
### Division(not closed operator)

the division will always return a float value:

```
> 3.0 / 2.0		--> 1.5
> 3 / 2			--> 1.5
```

### Floor division(closed operator)

```
> 3 // 2		--> 1
> 3.0 // 2	--> 1.0
> 6 // 2		--> 3
> 6.0	// 3.0	--> 2.0
> -9 // 2		--> -5
> 1.5	// 0.5	--> 3.0
```

### Modulo operator

`a % b == a - ((a // b) * b)`

more: For real operand, modulo has some unexpected uses.For instance, x - x % 0.01 is x with exactly two decimal digits

```
> x = math.pi
> x - x%0.01		--> 3.14
> x - x%0.001		--> 3.141
```
## Relational Operators		
<,    >,    <=,    >=,      ==, 		~=

**Compparison of numbers always disregrads their subtypes**

`1 == 0.1.  --> true`

## The Mathematical Library

type of the mathematical lib:  

1. trigonometric	functions(sin,cos,tan,asin,etc.)
2. logarithms
3. rounding 
4. max and min
5. pseudo-random(random)
6. pi and huge

### Random-number generator		

*math.random*

| usage    |    description  |  
|:------------------:|:---------------|
|math.random()        |  return a real of [0,1)|
|math.random(n)		| return an integer of [1,n] |
|math.random(m,n)   | reutrn an integer of [m,n]|


the **random** is from the pseudo-random seed funciton **randomseed**,before use
the random,you add `math.randomseed(os.time())`

### Rouding functions

| name     |   description			|       example      |
|:---------|:---------------------|:-----------------|
|math.floor()|towards minus infinite|math.floor(3.3)-->3 math.floor(-3.3) -->-4|
|math.ceil | towords plus infinite | math.ceil(3.3)-->4 math.ceil(-3.3) --> -3|  
|math.modf() | besides the rounded value,alse returns the fractional part of the number as a second result |math.modf(3.3)--> 3 0.3 math.modf(-3.3)--> -3 -0.3 |

##	Representation Limits

Standard Lua uses 64-biy integer.When we compute an integer operation the would result in a value smaller than mininteger or larger thean maxinteger, the result **wraps around**.

```
> math.maxinteger + 1 == math.mininteger	--> true(overflow)
> math.mininteger - 1 == math.maxinteger  	--> true(underflow)
> -math.mininteger == math.mininteger		-->	 true
> math.mininteger // -1 == math.mininteger	--> true
```
## Conversions

* To force a number to be a float, simplu add 0.0 to it

```
> -2 + 0.0		--> -2.0
> 0x7fffffffffffffff + 0.0 --> 9.2233720368548e+18
```

* Any integer up to 2^53 (which is 9007199254740992) has an exact representation as a double-precision floating-point number. Integers with larger absolute values may lose precision when converted to a float:

```
> 9007199254740991 + 0.0 == 9007199254740991 --> true> 9007199254740992 + 0.0 == 9007199254740992 --> true> 9007199254740993 + 0.0 == 9007199254740993 --> false
```

* In the last line, the conversion rounds the integer 2^53+1 to the float 2^53, breaking the equality. To force a number to be an integer, we can OR it with zero:

```
 > 2^53      	 --> 9.007199254741e+15      (float) > 2^53 | 0 	 --> 9007199254740992        (integer)
```
* Lua does this kind of conversion only when the number has an exact representation as an integer, that is, it has no fractional part and it is inside the range of integers. Otherwise, Lua raises an error:

```
> 3.2 | 0       -- fractional part stdin:1: number has no integer representation> 2^64 | 0      -- out of rangestdin:1: number has no integer representation> math.random(1, 3.5)stdin:1: bad argument #2 to 'random'                            (number has no integer representation)
```
To round a fractional number, we must explicitly call a rounding function.

* Another way to force a number into an integer is to use **math.tointeger**, which returns nil when the number cannot be converted: 

```
> math.tointeger(-258.0) --> -258> math.tointeger(2^30)	--> 1073741824> math.tointeger(5.01)	--> nil      (not an integral value)> math.tointeger(2^64) --> nil      (out of range)```

## Precedence

From higher to lower priority:

1. ^
2. unary operators (- # ~ not)
3. * / // %
4. +  -
5. ..	(concatentation)
6. <<	>> (bitwise shifts)
7. &		(bitwise AND)
8. ~		(bitwise exclusive)
9. |		(bitwise OR)
10. < > <= >= ~= ==
11. and
12. or

example:

```
a+i < b/2+1          <-->	(a+i) < ((b/2)+1)5+x^2*8              <-->	5+((x^2)*8)a < y and y <= z     <-->	(a < y) and (y <= z)-x^2                 <-->  -(x^2)x^y^z                <-->	x^(y^z)
```
**When in doubl.always use explicit !!**

## Lua Before Integers  

Before Lua 5.3 all numbers is treated as **float**





















