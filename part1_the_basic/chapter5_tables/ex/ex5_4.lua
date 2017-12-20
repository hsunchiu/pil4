--[[
We can represent a polynomial anxn + an-1xn-1 + ... + a1x1 + a0 in Lua as a list of its coef- ficients, such as {a0, a1, ..., an}.

Write a function that takes a polynomial (represented as a table) and a value for x and returns the poly- nomial value.

]]

function polynomial( coefficients, x )
	local result = 0
	for i,v in ipairs(coefficients) do
		result = result + v * x ^ (i - 1)
	end
	return result
end

a = {1,2,3}
print(polynomial(a, 2))   --> 17.0