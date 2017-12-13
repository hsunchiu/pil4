-- if the x is too big math.float(x + 0.5) is out of control.to avoid this,we do this
function round( x )
	local f = math.floor(x)
	if x == f then 
		return f 
	else
		return math.floor(x + 0.5)
	end
end
