-- > What is the result of the expression 2^3^4? What about 2^-3^4

print(2^3^4)		-->2.4178516392293e+24 equals 2^81
print(2^-3^4)		-->4.1359030627651e-25 equals 2^(-81)

---> so the precedence: ^ > -(unary) and we compute ^ from right to left.