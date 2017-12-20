--[[
Suppose that you want to create a table that maps each escape sequence for strings (the section called “Literal strings”) to its meaning. How could you write a constructor for that table?

]]

escapes = {
	['\a'] = 'bell',
	['\b'] = 'back space',
	['\f'] = 'form feed',
	['\n'] = 'newline',
	['\t'] = 'horizontal tab',
	['\v'] = 'vertical tab',
	['\\'] = 'backslash',
	['\"'] = 'double quote',
	['\''] = 'single quote'
}

