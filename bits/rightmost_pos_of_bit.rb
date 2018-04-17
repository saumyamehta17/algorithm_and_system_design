def rightmost_bit(num)
  binary_str = ''
  while(num > 0)
    binary_str += (num%2).to_s
    num = num/2
  end
  n = binary_str.length
  i = 0
  while(i < n)
    if(binary_str[i].to_i == 1)
      puts binary_str[i].to_i*(2**i)
      break
    end
    i += 1  
  end

  # puts 'Not Found'  
end

rightmost_bit(18)  

# or we can do it like following 
# binary of 18    = 010010
# binary of 18-1  = 010001
# and negate 18-1 = 101110
# anding of 18 and 17 - 010010 & 101110 = 000010 i.e 2
# you will find rightmost bit of 1