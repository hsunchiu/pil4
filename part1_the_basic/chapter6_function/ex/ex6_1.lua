--[[
Write a function that takes an array and prints all its elements.
]]

function print_all_element( a )
	print(table.unpack(a))
end

a = {1,2,4,5,6,'hello'}

print_all_element(a)