--[[
The table library offers a function table.concat, which receives a list of strings and returns their concatenation:
      print(table.concat({"hello", " ", "world"}))    --> hello world
Write your own version for this function.
Compare the performance of your implementation against the built-in version for large lists, with hundreds
of thousands of entries. (You can use a for loop to create those large lists.)
]]

function my_concat( table )
	local string = ''
	for i,v in ipairs(table) do
		string = string .. v
	end
	return string
end


a = {'a',1,3,'5','7'}

print(my_concat(a))