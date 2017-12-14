--> Redo the previous exercise for UTF-8 strings:
-- 		>insert("ação", 5, "!")   --> ação!
--> (Note that the position now is counted in codepoints.)
---> I haven't check the boundary
-- !Warning : in my mac, ação has six characters if I copy for the exercise,please convert to a right form with 4 char


function insert( s1, position, s2 )
	return string.sub(s1, 1, utf8.offset(s1,position) - 1) .. s2 .. string.sub(s1,utf8.offset(s1,position),-1)
end

print(insert('ação',5, '!'))