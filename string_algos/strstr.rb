def strstr(str, x)
  n1 = str.length
  n2 = x.length
  i = 0
  return -1 if n1 < n2
  while(i < n1-n2)
    if(str[i...(i+n2)] == x)
      return i
    end
    i += 1  
  end
  return -1  
end

str = "GeeksforGeeks"
x = "for"
x = "Fr"
puts strstr(str, x)  