-- >Write a function to remove a slice from a string; the slice should be given by its initial position and its length:
-- > remove("hello world", 7, 4)     --> hello d


function remove(s, position, n)
	return string.sub(s,1,position - 1) .. string.sub(s,position + n)
end

print(remove("hello world",7,4))