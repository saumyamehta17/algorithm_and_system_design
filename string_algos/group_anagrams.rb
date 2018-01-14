
def group(arr)
  n = arr.length

  i = 0
  while(i < n)
    j = i + 1
    while(j < n)
      if is_anagram(arr[i], arr[j])
        unless (j == (i + 1))
          #swap
          temp = arr[j]
          arr[j] = arr[i + 1]
          arr[i + 1] = temp
        end
        i += 1
      end
      j += 1
    end  
    i += 1
  end
  puts arr.to_s  
end

def is_anagram(str1, str2)
  len1 = str1.length
  len2 = str2.length
  if(len1 != len2)
    return false
  end

  i = 0
  anagram_arr = Array.new(127, 0)
  while(i < len1)
    anagram_arr[str1[i].ord] += 1
    i += 1
  end

  i = 0
  while(i < len2)
    count = anagram_arr[str2[i].ord] -= 1
    i += 1
    return false if(count < 0)
  end
  true
end  

arr = ['cat', 'dog', 'silent', 'god', 'listen', 'act']
group(arr)
