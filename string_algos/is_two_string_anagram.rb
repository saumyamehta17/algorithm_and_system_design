# anagram - one string is permutation of another string..
# ex SILENT is permutation of LISTEN

def anagram?(str1, str2)
  len1 = str1.length
  len2 = str2.length
  if(len1 != len2)
    return "No"
  end  
  arr = Array.new(128, 0)
  0.upto(len1-1).each do |ind|
    arr[str1[ind].ord] += 1
  end

  0.upto(len2-1).each do |ind|
    if arr[str1[ind].ord] == 0
      return "No"
    else
      arr[str1[ind].ord] -= 1
    end  
  end  
  return "YES"
end

str1 = "anamgram"
str2 = "nagamram"
puts anagram?(str1, str2)  