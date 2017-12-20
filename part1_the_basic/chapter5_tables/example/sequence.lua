-- read 10 lines, storing them in a table

a = {}
for i = 1, 10 do
	a[i] = io.read()
end

for i = 1, #a do
	print(a[i])
end

v = 11
a[#a + 1] = v		-- appends 'v' to the end of the sequence

