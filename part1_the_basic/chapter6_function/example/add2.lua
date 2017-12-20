function add( ... )
	local s = 0
	for _, v in ipairs{...}	do
		s = s + v
	end
	return s
end

print(add(1,2,4,5,6))