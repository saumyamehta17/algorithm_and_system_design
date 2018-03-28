def del_adjacent_dup(str, n)
  return nil if n == 0
  prev = str[0]
  i = 1; c = 0

  while(i < n)
    if(prev != str[i])
      if(c == 0)
        print prev
      end
      c = 0; prev = str[i]  
    else
     c += 1
    end
    i += 1   
  end

  print prev if c == 0

end  

# str = "acaaabbbacdddd"
str = "geeksforgeek"
n = str.length
del_adjacent_dup(str, n)