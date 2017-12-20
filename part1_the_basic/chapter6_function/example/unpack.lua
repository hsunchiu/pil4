function unpack( t, i, n )
	i = i or 1
	n = n or #t
	if i <= n then
		return t[i], unpack(t, i + 1, n)
	end
end

a = {1,3,4,5,6}

print(unpack(a,1))