--[[
Write a function that takes an arbitrary number of values and returns all of them, except the last one.
]]

function ex6_3( ... )
	arg = table.pack(...)
	table.remove(arg)
	return table.unpack(arg)
end


print(ex6_3(1,2,3,4,5))