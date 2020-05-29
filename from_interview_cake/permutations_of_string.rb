# Time complexity is o(n*n!)
# base function is called n! times and permutations are n! . ex - n = 3, then 3! = 6
# loop called n times before each base function
# total = n*n!
require 'pry'
def permute(str, choosen = "")
  if str == ""
    puts choosen
    return
  else

    i = 0; n = str.length
    while(i < n)

      # CHOOSE
      c = str[i]
      choosen = choosen + c
      str.slice!(i)

      # EXPLORE
      permute(str, choosen)

      # UNCHOOSE
      choosen = choosen.chop
      str = str.insert(i,c)
      i += 1
    end
  end

end

str = "rat"
permute(str)