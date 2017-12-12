-- > Write a simple script that prints its own mame without knowing it in advance.

local my_name = ""


for i,v in ipairs(arg) do
	if #arg == 0 then
		print("please enter your name!")
		break;
	end
	if i < #arg then
		my_name = my_name .. v .. " "  
	else
		my_name = my_name .. v
	end
end

if #arg > 0 then
	print("My name is " .. my_name)
end
