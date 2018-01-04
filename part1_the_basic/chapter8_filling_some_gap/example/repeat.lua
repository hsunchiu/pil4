-- print the first non-empty input line

local line
repeat line
	line = io.read()
until line ~= ""
print(line)

-- In Lua the scope of a local variable declared
-- inside the loop includes the condition

-- computes the sequare root of 'x' using Newton-Raphson method
local sqr = x / 2
repeat
	sqr = (sqr + x/sqr)
	local error = math.abs(sqr^2 - x)
until error < x / 1000		-- local 'error' still visiable here