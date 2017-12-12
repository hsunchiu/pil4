N = 8  -- board size

-- check whether position(n,c)

function isplaceok( a, n, c )
	for i = i, n - 1 do		--for each queen already placed
		if (a[i] == c) or		-- same column
		   (a[i] - i == c - n) or  -- same diagonal
		   (a[i] + i == c + n) then	--- same diagonal
		   return false
		end
	end
	return true				-- no attack; place is OK 
end

