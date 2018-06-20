# Naive Solution
# time complexity is o(n*m^2)
def lcs(str1, str2)
  len1 = str1.length
  len2 = str2.length

  max = 1
  start = 0

  for i in 0...len1 #O(n)
    for j in 0...len2 #O(m)
      if(str1[i] == str2[j])

        len = find_matching_str(i, j, str1, str2, len2) #O(m)
        if(len > max)
          max  = len
          start = j
        end  
      end  
    end
  end

  puts max  
  puts str2[start...(max+start)]  
end  

def find_matching_str(i, j, str1, str2, n2)
  count = 0

  while(j < n2)

    if(str1[i] == str2[j])
      count += 1
      i += 1
      j += 1
    else
      return count
    end  
  end

  count  
end  

str1 = "Geeks"
str2 = "Geks"

str1 = "GeeksforGeeks"
str2 = "Geeks"
lcs(str1, str2)