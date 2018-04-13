def find(str)
  i = 0
  max = 1
  local = 0
  hsh = {}
  while(i < str.length)
    prev = hsh[str[i]] || 0
    if hsh[str[i]].nil? || ((i - local) > prev)
      local += 1
    else
      max = [max, local].max  
      local = i - prev
    end
    hsh[str[i]] = i
    i += 1  
  end
  max 
end

# str = "geeksforgeeks"
# str = "abababcdefababcdab"
str = "ABDEFGABEF"
puts find(str)  