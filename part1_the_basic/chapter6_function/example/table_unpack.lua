print(table.unpack({10,20,20}))
a, b = table.unpack({10,20,30})
print(a,b)

f = string.find
a = {'hello', 'll'}
print(f(table.unpack(a)))

 print(table.unpack({"Sun", "Mon", "Tue", "Wed"}, 2, 3))
  print(table.unpack({"Sun", "Mon", "Tue", "Wed"}, 2, 4))	-- from 2nd to 4th