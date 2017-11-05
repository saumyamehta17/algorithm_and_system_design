# Permutation - several possible ways in which things can be arranged or ordered
# for ex - cat permutation are - cat, cta, act, atc, tac, tca etc
# n is length of string, so n*n-1*n-2 = 3*2*1 = 6 possible ways
# or n!/(n-k)! for this example k = n, where we have pick all three
# lets say we have 8 player, where after tournament we can award them with Gold, Silver, Bronze Medal
#  So we three selection out of 8, where if Gold is selected and then we have 7 selection and if Silver is selected then we 6
# so permutation will be 8*7*6 i.e n = 8, k = 3
# 8!/5! i.e 8*7*6

# lets say str = 'cats', we can keep last_char = s, and now substring  = 'cat', we can arrange like , len = 3
# substring[0] + last_char + substring[remaing]
# substring[0...pos] + last_char + substring[pos...remaing_but_not_include_pos]

require 'set'
require 'pry'

def get_permutation(str)

  if(str.length <= 1)
    return Set.new.add(str)
  end  

  all_char_except_last = str[0...-1]
  last_char = str[-1]

  all_permutations = get_permutation(all_char_except_last)

  permutations = Set.new
  all_permutations.each do |substr|
    (0..all_char_except_last.length).each do |position|
      permutation = substr[0...position]  + last_char + substr[position..-1]
      permutations.add(permutation)
    end  
  end

  return permutations

end  

get_permutation('cat').each do |per|
  puts per
end

