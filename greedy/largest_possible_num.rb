# naive sol will have complexity of o(10^digits)
# for ex - if 1 digit then 0 to 9 = 10
# if 2 digit then (0..9) * (0..9) and so on = 10^2

# followin with complexity is o(digits)
def largest_possible_num(digits, sum)
  if sum > digits*9 
    return "Not Possible"
  end  

  if sum == 0
    return 0
  end

  res = Array.new(digits)

  for i in 0...digits
    if sum >= 9
      res[i] = 9
      sum -= 9
    else
      res[i] = sum
      sum = 0
    end  
  end

  puts res.join 
end  

digits = 3
sum = 20
largest_possible_num(digits, sum)