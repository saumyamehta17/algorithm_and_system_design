def num_required_recursion(str, l, h)

  #base cases
  if(l > h)
    return 0
  elsif(l == h)
    return 0
  elsif(l == h-1) #str length of 2
    str[l] == str[h] ? 0 : 1
  end

  return str[l] == str[h] ?
         num_required_recursion(str, l+1, h-1) :
         [
          num_required_recursion(str, l, h-1),
          num_required_recursion(str, l+1, h)
         ].min + 1
end  

str = "geeks"
# puts num_required_recursion(str, 0, str.length-1)

# above solutions have overlapping subproblem, 
# which mean we are processing many substrings multiple times, 
# so solve this use following
def num_required(str, n)
  #initialized table with all 0's - taking o(n2) space
  tb = Array.new(n) {Array.new(n, 0)}

  gap = 1
  while(gap < n)
    l = 0; h = gap
    while(h < n)
      tb[l][h] = str[l] == str[h] ?
                 tb[l+1][h-1] :
                 [tb[l][h-1], tb[l+1][h]].min + 1
      h += 1
      l += 1                 
    end
    gap += 1  
  end

  return tb[0][n-1]  
end
str = "geeks"
puts num_required(str, str.length)  