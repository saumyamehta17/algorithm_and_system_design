# Remove chars(which are in remove_str) from str
# sol1 - when we find a char to remove then shift other elem to left
#  comlpexity: (n-1) + (n-2) + .. + 1 = n^2
# sol2 - take a tempory str to store chars which are not in remove_str
#  complexity: o(n), but space complexity is o(n)
# sol3 - below 
def removeFromString(str, remove_str)
  n = str.length
  flags = Hash.new(false)
  remove_str.split('').each do |c|
    flags[c] = true
  end

  dst = 0
  for src in 0...n
    if !flags[str[src]]
      str[dst] = str[src]
      dst += 1
    end  
  end

  puts str[0...dst]  
end  

str = 'Kevin Bacon'
remove_str = 'aeiou'
removeFromString(str, remove_str)