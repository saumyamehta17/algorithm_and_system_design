# Time complexity is o(n!)
# We can optimize the performance with arm-length recursion: which checks base condition before calling recursion
# But arm length reursion is frowned-upon(have a angry look or displeased)
def permute(input, output, used_flags, n)

  if n == output.length
    puts output
    return
  end

  for i in 0...n
    next if used_flags[i]
    output += input[i]
    used_flags[i] = true
    permute(input, output, used_flags, n)
    used_flags[i] = false
    output.chop!
  end  
end  

input = 'cat'
n = input.length
used_flags = Array.new(n, false)
output = ''
permute(input, output, used_flags, n)  