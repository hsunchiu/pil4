--[[
Write a function that inserts all elements of a given list into a given position of another given list.
]]

function table_insert( src, des, position )
	local temp = {}
	table.move(des, position, position + #src, 1, temp)	
	table.move(src, 1, #src, position, des)
	table.move(temp, 1, #temp, #des + 1, des)
end

a = {1,2,3,4,5,6}

b = {7,7,7,7,7,7}

table_insert(a,b,4)

for i,v in ipairs(b) do
	print(i,v)
end
