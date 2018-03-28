def is_rotated(str1, str2, k, pattern = 'clockwise')

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
puts is_rotated(str1, str2, 2,'anti-clockwise')  

str1 = "amazon"
str2 = "onamaz"
puts is_rotated(str1, str2, 2)  