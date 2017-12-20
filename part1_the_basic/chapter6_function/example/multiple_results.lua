s, e = string.find('hello Lua users', 'Lua')

print(s,e)	--> 7 9

function foo0 () end		-- returns no results
function foo1 () return "a" end		-- returns 1 result
function foo2 () return "a", "b" end	-- returns 2 results

x, y = foo2()		
print(x ,y)		-->	a b
x, y, z = foo2()
print(x,y,z)	--> a b nil

x,y = foo0()
print(x,y)		--> nil nil
x,y = foo1()	-- x="a", y=nil

x,y,z = foo2()	-- x="a", y="b", z=nil


 x,y = foo2(), 20      -- x="a", y=20   ('b' discarded)

 x,y = foo0(), 20, 30  -- x=nil, y=20   (30 is discarded)

print(foo0())		--> (no results)
print(foo1())		--> a
print(foo2())		--> a	b
print(foo2(), 1)	--> a	1
print(foo2() .. 'x')	--> ax	(see next)


t = {foo0()}	-- t = {}  (an empty table)
t = {foo1()}	-- t = {}  (an empty table)
t = {foo2()}	-- t = {"a", "b"}

t = {foo0(), foo2(), 4} -- t[1] = nil, t[2] = "a", t[3] = 4


function foo (i)
        if i == 0 then return foo0()
        elseif i == 1 then return foo1()
elseif i == 2 then return foo2()
end end
print(foo(1))	--> a
print(foo(2))	--> a  b
print(foo(0))	-- (no results)
print(foo(3))	-- (no results)

print((foo0()))	--> nil
print((foo1()))	--> a
print((foo2()))	--> a










