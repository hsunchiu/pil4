-- the demo will occur stack over flow if a nagative number is givenß
-- define a factorial function
function factorial( n )
	if n < 0 then
		return "negative number have no factorial function"
	end
	if n == 0 then
		return 1
	else
		return n * factorial(n - 1)
	end
end

print("enter a number:")
a = io.read("*n")
print(factorial(a))