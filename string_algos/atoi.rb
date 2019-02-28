def atoi(str)
  i = 0
  n = str.length
  negative = 1
  output = 0
  if str[i] == '-'
    negative = -1
    i += 1
  end

  for j in i...n
    digit = str[j].ord - '0'.ord
    if (0...10) === digit
      output *= 10  
    else
      digit = 0  
    end  
      
    output += digit
  end 
  negative * output
end  

str ='-883'
str = '-91sj'
puts atoi(str)