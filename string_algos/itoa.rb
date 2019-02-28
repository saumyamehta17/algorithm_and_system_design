def itoa(number, base = 10)
	if number == 0
		puts '0'
		return
	end

	i = 0
	arr = Array.new
	negative = false

	if number < 0
		negative = true
		number = number.abs
	end

	while(number > 0)
		rem = number % 10
		number = number / 10
		arr[i] = (rem.ord + '0'.ord).chr
		i += 1
	end

	if negative
		arr[i] = '-'
	end	

	while(i >= 0)
		print arr[i]
		i -= 1
	end	
	puts

end	

number = -121
itoa(number, base = 10)