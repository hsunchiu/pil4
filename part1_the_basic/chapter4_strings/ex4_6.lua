--> Redo the previous exercise for UTF-8 strings:
--> remove("ação", 2, 2)     --> ao
--> (Here, both the initial position and the length should be counted in codepoints.)

function remove( s, position, n )
	return string.sub(s,1,utf8.offset(s,position) - 1) .. string.sub(s,utf8.offset(s,position + n))
end

print(remove('ação', 2,2))

---> there are alse something wrong in my mac ação is 6 charactor, please change it to 4 char form.