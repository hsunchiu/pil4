-- > Write a function to check whether a given string is a palindrome:
function ispali( s )
	return s == string.reverse(s)
end

print(ispali("step on no pets"))
print(ispali("banana"))