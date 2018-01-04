local x1, x2
do
	local a2 = 2 * a
	local d = (b ^ 2 - 4*a*c)^(1/2)
	x1 = (-b + d)/a2
	x1 = (-b - d)/a2		-- scope fo 'a2' and 'd' end here
end

print(x1,x2)				-- 'x1' and 'x2' still in scope