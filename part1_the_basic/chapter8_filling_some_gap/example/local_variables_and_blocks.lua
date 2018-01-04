x = 10
local i = 1		-- local to the chuck

while i <= 10 do
	local x = i * 2  -- local to e the while
	print(x)		-- > 2, 4, 6 ,8, ...
	i = i + 1
end

if i > 20 then
	local x			-- local to the "then" body
	x = 20
	print( x + 2)	-- (would print 22 if the test succeeded)
else
	print(x)		--> 10 (the global one)
end

print(x)			--> 10 (the global one)

