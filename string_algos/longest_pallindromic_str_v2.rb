# space complexity is o(1)
# time complexity is o(n^2)
def longest_pallimdromic_substr(str)
  maxlen = 1
  start = 0
  n = str.length
  for i in 1...n

    # even Case
    low = i-1
    hi = i
    while(low >= 0 && hi < n && str[low] == str[hi])
      if(hi-low+1 > maxlen)
        maxlen = hi - low + 1
        start = low
      end
      low -= 1
      hi += 1  
    end
    

    # odd Case
    low = i-1
    hi = i + 1
    while(low >= 0 && hi < n && str[low] == str[hi])
      if(hi-low+1 > maxlen)
        maxlen = hi - low + 1
        start = low
      end
      low -= 1
      hi += 1
    end  
  end

  puts "maxlength is #{maxlen}"
  puts "string is #{str[start..(start+maxlen)]}"  
end  


str = "forgeeksskeegfor"
str = "geeksskeeg"
longest_pallimdromic_substr(str)