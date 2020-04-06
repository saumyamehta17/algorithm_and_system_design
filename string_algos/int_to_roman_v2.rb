# consider max number is 3999
M = ['', 'M', 'MM', 'MMM']
C = ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM']
X = ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC']
I = ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX']

def num_to_roman(num)

	thousands = M[num/1000]
	hundreds = C[(num%1000)/100]
	tens = X[(num%100)/10]
	ones = I[num%10]

	thousands + hundreds + tens + ones
end

num = 3549
puts num_to_roman(num)
