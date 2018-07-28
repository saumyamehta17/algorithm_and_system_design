x = 2
y = 7

while(y != 0)
  # 0 & 1 = 0
  c = x & y

  # 0 ^ 1 = 1
  x = x ^ y

  # 10 << 1 =  100
  y = c << 1
end 

puts x 