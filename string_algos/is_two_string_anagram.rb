# anagram - one string is permutation of another string..
# ex SILENT is permutation of LISTEN
require 'pry'
def is_permutation(str1, str2)
  # if length is not same , they are never 
  str1_length = str1.length
  str2_length = str2.length
  if(str1_length != str2_length)
    return false
  end  
  letters = []
  0.upto(126){|x| letters[x] = 0}

  0.upto(str1_length - 1) do |x|
    letters[x] += 1
  end 

  0.upto(str2_length - 1).each do |x|
    count = letters[x] -= 1
    if(count < 0)
      return false
    end  
  end
  return true 
end  

# puts is_permutation('Silennnt', 'Listenn')
puts is_permutation('catc', 'tac')