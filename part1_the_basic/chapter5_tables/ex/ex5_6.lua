--[[
Write a function to test whether a given table is a valid sequence.
]]

function nonils( a )
	local arg = table.pack(table.unpack(a))
	for i = 1, arg.n do
		if arg[i] == nil then
			return false
		end
	end
	return true
end

a = {1,2,3}
print(nonils(a))

