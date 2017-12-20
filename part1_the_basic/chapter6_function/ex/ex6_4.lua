--[[
Write a function that takes an arbitrary number of values and returns all of them, except the last one.
]]


function random_shuffle(...)
	arg =table.pack(...)
	math.randomseed(os.time())
	for i = 1, arg.n do
		local n = math.random(1,arg.n)
		arg[i] , arg[n] = arg[n] ,arg[i]
	end
	return table.unpack(arg)
end


print(random_shuffle(0,1,3,4,5,6))