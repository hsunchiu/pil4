function maximum( a )
	local mi = 1		-- index of the maximum value
	local m = a[mi]		-- maximum value
	for i = 1, #a do
		if a[i] > m then
			mi = i;
			m = a[i];
		end
	end
	return m, mi
end

print(maximum({1,2,4,5,6,7,8}))