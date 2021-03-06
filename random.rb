def is_match(s, p)
   m = s.length
   n = p.length
   mtrx = Array.new(m+1) {Array.new(n+1)}

   mtrx[0][0] = true
   
   for i in (1...m+1)
       mtrx[i][0] = false
   end
    
  for i in (1...n+1)
      mtrx[0][i] = p[i-1] == '*' ? mtrx[0][i-2] : false
  end  
   
   for i in (1...m+1)
       for j in (1...n+1)
           mtrx[i][j] = if s[i-1] == p[j-1] || p[j-1] == '.'
                        mtrx[i-1][j-1]
                elsif p[j-1] == '*'
                    mtrx[i][j-2] || ((s[i-1] == p[j-2] || p[i-2] == '.') && mtrx[i-1][j-1])
               else
                    false
               end
               
       end
   end
   puts mtrx.to_s 
   puts mtrx[m][n] 
end
s = 'aa'
p = '.*'
is_match(s,p)
# def all_turned_bulbs_shines?(bulbs, i, n)
#   while(i < n)
#     if bulbs[i] == 1
#       return false
#     end 
#     i += 1
#   end
#   true    
# end

# def find_moments(arr)
#   moments = 0
#   n = arr.length
#   bulbs = Array.new(n, 0)

#   for i in 0...n
#     j = arr[i] - 1

#     if j == 0 || bulbs[j-1] == 2
#       bulbs[j] = 2
#       k = j+1
#       while(bulbs[k] && bulbs[k] == 1)
#         bulbs[k] = 2
#         k += 1
#       end  

#       if all_turned_bulbs_shines?(bulbs, j, n)
#         moments += 1
#       end  
#     else
#       bulbs[j] = 1
#     end  
#   end  

#   moments
# end  

# arr = [2,1,3,5,4]
# arr = [2,3,4,1,5]
# arr = [1,3,4,2,5]
# puts find_moments(arr)

# def fib(n)
#   if n == 0 || n == 1
#     return n
#   end

#   fib(n-1) + fib(n-2)  
# end  

# def print_permutations(str)
# 	map = Hash.new(0)
# 	str.each_char { |chr| map[chr] += 1}
# 	chars = map.keys.sort
# 	count = Array.new(0, chars.size)
# 	chars.each_with_index { |chr, i| count[i] = map[chr]}
# 	helper(chars, count, 0, Array.new(str.length))
# end

# def helper(chars, count, level, result)
# 	if level == result.length
# 		puts result.join
# 		return
# 	end

# 	for i in 0...count.length
# 		next if count[i] == 0
# 		new_count = count.dup
# 		new_count[i] -= 1
# 		result[level] = chars[i]
# 		helper(chars, new_count, level + 1, result.dup)
# 	end
# end

# for str in ['BCA', 'ABB']
# 	puts "Input: #{str}"
# 	print_permutations str
# end
