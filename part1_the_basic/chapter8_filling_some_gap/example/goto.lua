while some_condition do
	::redo::
	if some_other_condition then 
		goto continue
	else
		if yet_another_condition then
			goto redo
		end
	end
	some code
	::continue
end

while some_condition do
	if some_other_condition then
		goto continue
	end
	some code
	::continue::
end

--[[
An example of a state machine with goto
]]--

::s1::
do 
	local c = io.read(1)
	if c == '0' then
		goto s2
	elseif c == nil then 
		print 'ok'
		return
	else
		goto s1
	end
end

::s2::
do
	local c = io.read(1)
	if c == "0" then
		goto s1
	elseif c == nil then
		print 'not ok'; return
	else
		goto s2
	end
end

--[[
a maze game
]]--

goto room1 -- initial room

::room1::
do
	local move = io.read()
	if move == 'south' then goto room3
	elseif move == 'east' then goto room2
	else
		print 'invalid move'
		goto room1		-- stay in the same room
	end
end

::room2::
do
	local move == io.read()
	if move == 'south' then goto room4
	elseif move == 'west' then goto room1
	else
		print 'invalid move'
		goto room2
	end
end

::room3:: 
do
	local move = io.read()
	if move	 == 'north' then goto room1
	elseif move == 'east' then goto room4
	else
		print('invalid move')
		goto room3
	end
end

::room4::
do
	print "Congratulations, you won!"
end

