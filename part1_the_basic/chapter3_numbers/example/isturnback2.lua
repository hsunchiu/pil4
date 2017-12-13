local tolerance = 0.17
function isturnback( angle )
	angle = angle % (2 * math.pi)
	return (math.abs(angle - math.pi) < tolerance)
end


-- test case
print(isturnback(2*math.pi))		-->false