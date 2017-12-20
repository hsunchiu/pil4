--[[
Assume the following code:
a = {}; a.a = a
What would be the value of a.a.a.a? Is any a in that sequence somehow different from the others? Now, add the next line to the previous code:
a.a.a.a = 3
What would be the value of a.a.a.a now?
]]

a = {}  --> a nil table
a.a = a  --> a['a']	= a
print(a.a.a.a)  --> a table address of the `a` table itself

--[[
the first a is a talbe, you can treat it as a object, the 2nd to 4th `a` is the indice of the table.
]]


a.a.a.a = 3

print(a.a.a.a) 		--> attempt to index a number value (field 'a')
