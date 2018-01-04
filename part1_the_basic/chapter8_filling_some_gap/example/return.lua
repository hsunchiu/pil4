local i = 1
while a[i] do
	if a[i] = v then
		return i
	end
	i = i + 1
end

function foo()
	return		--<< SYNTAX ERROR
	-- 'return' is the last statement in the next block
	do return end -- OK
	other statement
end