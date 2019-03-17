# def fib(n)
#   if n == 0 || n == 1
#     return n
#   end

#   fib(n-1) + fib(n-2)  
# end  

def print_permutations(str)
	map = Hash.new(0)
	str.each_char { |chr| map[chr] += 1}
	chars = map.keys.sort
	count = Array.new(0, chars.size)
	chars.each_with_index { |chr, i| count[i] = map[chr]}
	helper(chars, count, 0, Array.new(str.length))
end

def helper(chars, count, level, result)
	if level == result.length
		puts result.join
		return
	end

	for i in 0...count.length
		next if count[i] == 0
		new_count = count.dup
		new_count[i] -= 1
		result[level] = chars[i]
		helper(chars, new_count, level + 1, result.dup)
	end
end

for str in ['BCA', 'ABB']
	puts "Input: #{str}"
	print_permutations str
end
