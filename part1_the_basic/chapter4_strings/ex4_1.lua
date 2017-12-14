-->How can you embed the following fragment of XML as a string in a Lua program?
--[=[
```
<![CDATA[
      Hello world
]]>
```
]=]

--> Show at least two different ways.

a = "<![CDATA[\n   Hello world\n]]>"

print(a)

a = [==[
<![CDATA[
   Hello world
]]>
]==]

print(a)



