--> Write a function to insert a string into a given position of another one:
--[[

> insert("hello world", 1, "start: ")    --> start: hello world
> insert("hello world", 7, "small ")     --> hello small world

]]


function insert( s1, position, s2 )
	return string.sub(s1,1,position - 1) .. s2 ..string.sub(s1,position)
end


print(insert("hello world", 1, "start: "))
print(insert("hello world", 7, "small "))
