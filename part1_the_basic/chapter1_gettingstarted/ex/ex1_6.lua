-- >How can you check whether a value is Boolean without using the function of **type**?
--  I think nil is also a type of boolean
function is_boolean_type( a )
	if a == true or a == false or a == nil then
		print(tostring(a) .. " is a boolean type")
	else
		print(tostring(a) .. " isn't a boolean type")
	end
end

--[[
test case:

$lua -i
> dofile("ex1_6.lua")
> is_boolean_type(a)
nil is a boolean type
> a = false
> is_boolean_type(a)
false is a boolean type
> a = 5
> is_boolean_type(a)
5 is't a boolean type
]]