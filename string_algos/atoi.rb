def atoi(str)
  i = 0
  res = 0
  sign = 1
  n = str.length
  return nil if(n == 0)

  if(str[0] == '-')
    sign = -1
    i += 1
  end

  while(i < n)
    val = str[i].ord - '0'.ord
    res = res*10 + val
    i += 1
  end

  sign*res  
end  

str = "-13a4"
puts atoi(str)