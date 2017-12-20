# Table

Tables are the main(in fact,the only) data structring mechanism in Lua.

Table in Lua are **objects**

* Ctreate it with form *{}*

```
> a = {}			-- create a talbe and assign its reference
> k = 'x'
> a[k] = 10		-- new entry, with key = 'x' and value = 10
> a[20] = 'great'  -- new entry, with key = 20 and value = 10
> a['x'] 			--> 10
> k = 20	
> a[k]				--> 'great'
> a['x'] = a ['x'] + 1 -- increment entry 'x'
> a['x']			--> 11
```

* A table is always anonymous

```
> a = {}
> a['x'] = 10
> b = a		--> `b` refers to the same talbe as `a`
> b['x']		--> 10
> b['x'] = 20
> a['x']		--> 20
> a = nil		--> only 'b' still refers to the table
> b = nil		--> no refernces left to the table
```
If there are no more references to a table, the garbage collector will eventually delete the table.

## Table Indice

* Each table can store values with diffent typdes of indices,and it grows as needed to accommodate new entres

```
> a = {}		-- empty table
> -- create 1000 new entries
> for i = 1, 1000 do a [i] = i * 2 end
> a[9]			--> 18
> a['x'] = 10
> a['x']		--> 10
> a['y']		--> nil
```
* table indice: **a.namea** is a syntactic sugar for **a['name']**

```
> a = {}
> a.x = 10
> a.x		--> 10
> a.y		-->nil
> a['x']	--> 10
```
More example:

```
> i = 10; j = '10'; k = '+10'
> a = {}
> a[i] = "number key"
> a[j] = 'string key'
> a[k]	= 'another string key'
> a[i]		--> number key
> a[j]		--> string key
> a[k]		--> another string key
> a[tonumber(j)]		--> number key
> a[tonumber(k)]		--> number key
> a = {}
> a[2.0]	= 10
> a[2.1]	= 20
> a[2]		--> 10
> a[2.0]	--> 20	(it converts the key 2.0 to 2)
> a[2.1]	--> 20 (float values the cannot be converted to integers remain unaltered)
```

## Talbe Constructors

- empty construcor,**{}**
- list initialization

``` Lua
days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}

print(days[4])		--> Wednesday
```
- record-like table

```
a = {x = 10, y = 20}
```
euivalent to 
`a = {}; a.x = 10; a.y = 20;` or `a={}; a['x'] = 10, a['y'] = 20`  
The original express is faster,Lua creates the table already with the right size.(but size is not fixed.)

```
w = {x = 0, y = 0, label = "console"}
x = {math.sin(0), math.sin(1), math.sin(2)}
w[1] = 'another field'		-- add key 1 to the table w
x.f = w						-- add key 'f' to the table x
print(w['x'])					--> 0
print(w[1])					--> 'another field'
print(x.f[1])					--> 'another field'
w.x	 = nil						--> remove field 'x'
```
- mix record-style and list-style

```
polyline = {color = 'blue',
			  thickness = 2,
			  npoints = 4,
			  {x=0, y=1},		-- polyline[1]
			  {x=-10, y=0},		-- polyline[2]
			  {x=-10, y=1},	-- polyline[3]
			  {x=0, y=1}		-- polyline[4]

}
```
Show the nest tables 
```
print(polyline[2].x)		--> -10
print(polyline[4].y)		--> 1
```
- More general format

```
opnames = {['+'] = 'add', ['-'] = 'sub',
			 ['*'] = 'mul', ['/'] = 'div',}
			 
i = 20; s = '-';

a = {[i+0] = s, [i+1] = s .. s, [i+2] = s .. s .. s}

print(opnames[s])			--> 'sub'
print(a[22])					--> '---'
```

### Arrays,Lists, and Sequences

Sequence is a list without hole(without nil key or nil value)

```
a = {}
a[1] = 1
#a   --> 1
a[2] = nil
#a   --> 1
a[2] = 2
#a 	  --> 2

```
If you really need to hanlde lists with holes, you should store the length explicitly somewhere.

### Table Traversal

- Traverse all key-value pairs in a talbe with **pairs** iterator:

```
t = {10, print, x = 12, k = "hi"}
for k, v in pairs(t) do
	pirnt(k, v)
end

 --> 1   10
 --> k	  hi
 --> 2   function: 0xXXXXX
 --> x   12
```
Due to the way that Lua implements tables, the order that elements appear in traversal is undefined.

- Use the **ipairs** iterator

```
t = {10, print, 12, 'hi'}
for k, v in ipairs(t) do
	print(k, v)
end
 --> 1 10
 --> 2 function: 0xXXXXX
 --> 3 12
 --> 4 hi
```

- With a numerical form

```
t = {10, print, 12, "hi"}
for k = 1, #t do
	print(k, t[k])
end
 --> 1  10
 --> 2  function: 0xXXXXXX
 --> 3  12
 --> 4	  hi
```

## Safe Navigation

- **a or {}**

```
zip = (((company or {}).director or {}).address or {}).zipcode
```
or

```
E = {}
...
zip = (((company or E).director or E).address or E).zipcode
```

## The table Library

- **table.insert** inserts an element in a given position of a sequence.

```
table.insert(t,1,15)	--> insert 15 to the 1st place in the table t
talbe.insert(t,15)		--> intert the element in the last position of the sequence
```

- **table.remove** remove and return an element from the given sequence, moving subsequent elements down to fill the gap.When called without a position, it removes the element of the sequence.

-- the **table.move(a,f,e,t)** moves thelelments in table **a** form index **f** until **e**(both inclusive) to position **t**
 
 ```
 -- insert a element
 table.move(a,1,#a,2)
 a[1]	= newElement		--> insert 'newElemet' to the talbe 'a'
 
 -- remove the first elemet
 table.move(a,2,#a,1)
 a[#a] = nil
```

-- **table.move(t1,f,e,f2,t2)** move the element from **f** to **e** in **t1** to the position **f2** in **t2**





 







