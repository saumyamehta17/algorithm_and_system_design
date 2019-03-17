def is_rotated(s1, s2)
  n1 = s1.length 
  n2 = s2.length
  if n1 != n2
    return false
  end

  for k in 0...n1
    i = 0
    while(s1[i] == s2[(i+k)%n1])
      i += 1
    end
    if i == n1
      return true
    end
  end  
  return false
end  
s1 = 'amazon'
s2 = 'azoiam'
puts is_rotated(s1, s2)

def is_rotated_by_2_places(str1, str2, k, pattern = 'clockwise')

    if pattern == 'clockwise'
      temp = str1
      str1 = str2
      str2 = temp
    end
    n1 = str1.length
    n2 = str2.length  

    if(n1 != n2)
      return 'NO'
    end  

    i = 0
    while(i < n1)
      if str1[(i+k)%n1] != str2[i]
        return 'NO'
      end
      i += 1  
    end
    return 'YES'  
end

str1 = "amazon"
str2 = "azonam"
puts is_rotated_by_2_places(str1, str2, 2,'anti-clockwise')  

str1 = "amazon"
str2 = "onamaz"
puts is_rotated_by_2_places(str1, str2, 2)  