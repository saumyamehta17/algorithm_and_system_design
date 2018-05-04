def to_binary(num)
  res = ""
  while(num > 0)
    res += (num % 2).to_s
    num = num/2
  end
  res  
end  
def find_diff(num1, num2)
  xor_val = num1 ^ num2
  binary_val = to_binary(xor_val)
  for x in 0...(binary_val.length)
    if binary_val[x].to_i == 1
      puts x+1
      return
    end  
  end  
end  

find_diff(52,4)