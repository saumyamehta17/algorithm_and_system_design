def longest_pallindrome_str(str, n)
  start = 0
  max_length = 1
  table = Array.new(n) {Array.new(n, false)}

  i = 0
  while(i < n)
    table[i][i] = true
    i += 1
  end

  i = 0
  while(i < n-1)
    if(str[i] == str[i+1])
      table[i][i+1] = true
      max_length = 2
      start = i
    end
    i += 1  
  end

  k = 3
  while(k <= n)
    i = 0
    while(i < (n-k+1))
      j = k+i-1
      if(table[i+1][j-1] && str[i] == str[j])
        table[i][j] = true
        if(k > max_length)
          max_length = k
          start = i
        end  
      end
      i += 1  
    end
    k += 1  
  end

  print "Original String is #{str} \n"+
        "SubString starts from #{start} to #{max_length} -- "+
        "#{str[start, max_length]} \n"  
end  

str = "GEEKEEG"
n = str.length
longest_pallindrome_str(str, n)