--[[
a numercial for has the following syntax:

for var = exp1, exp2, exp3 do
	something
end



]]--

for i = 1, math.huge do
	if (0.3*i^3 - 20*i^2 - 500 >= 0) then
		print(i)
		break
	end
end


for i = 1, 10 do 
	print(i)
end
max = i  -- probably wrong
print(max)	--> nil

-- find a value in a list
local found = nil
for i = i, #a do
	if a[i] < 0 then
		found = i
		break
	end
end
print(found)

