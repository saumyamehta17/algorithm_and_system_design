# space complexity is o(n^2)
# time complexity is o(n^2)
def longest_pallimdromic_substr(str)
  start = 0; maxlength = 1
  n = str.length
  t = Array.new(n){Array.new(n, 0)}
  #process diagnal bcoz they will always be equal
  (0...n).each do |i|
    t[i][i] = 1
  end

  (0...n).each do |i|
    if str[i] == str[i+1]
      t[i][i+1] = 1 
      maxlength = 2
      start = i
    end  
  end

  k = 2
  while(k < n)
    i = 0
    while(i < n-k)
      j = i+k
      if(t[i+1][j-1] == 1 && str[i] == str[j])
        t[i][j] = 1
        maxlength = k+1
        start = i
      end
      i += 1  
    end
    k += 1  
  end
  puts maxlength
  puts str[start..(start+maxlength-1)]
end

str = "okgegk"
str = "forgeegfor"
str = "forgeeksskeegfor"
str = "geeksskeeg"
longest_pallimdromic_substr(str)

