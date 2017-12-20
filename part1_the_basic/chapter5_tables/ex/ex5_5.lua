--[[
Can you write the function from the previous item so that it uses at most n additions and n multiplications (and no exponentiations)?


]]

function polynomial( coefficients, x )
	local result = 0
	for i = #coefficients, 1, -1 do
		result = result * x + coefficients[i]
	end
	return result
end


--test case
coefficients = {1,2,3}
print(polynomial(coefficients,2))

