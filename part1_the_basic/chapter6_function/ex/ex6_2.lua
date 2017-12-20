--[[
Write a function that takes an arbitrary number of values and returns all of them, except the first one.
]]

function ex6_2( ... )
	arg = table.pack(...)
	table.remove(arg,1)		
	return table.unpack(arg)
end


print(ex6_2(1,2,3,4))

