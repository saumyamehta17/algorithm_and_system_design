require 'pry'
def lcs(str1, str2)
  n1 = str1.length
  n2 = str2.length
  return if n1 <= 0 || n2 <= 0

  table = Array.new(n1) {Array.new(n1, 0)}
  i = 0; j = 0
  max = 0;
  res_index1 = 0
  res_index2 = 0

  while(i < n1)
    j = 0
    while(j < n2)
      if(str1[i] == str2[j])

        val = (i-1 < 0 || j-1 < 0) ? 0  : table[i-1][j-1]
        table[i][j] = val > 0 ? val + 1 : 1
        if(table[i][j] > max)
          max = table[i][j]
          res_index1 = i
          res_index2 = j
        end  
      end
      j += 1  
    end
    i += 1  
  end

  puts max
  i = 0
  puts table.to_s
  while(res_index2 >= 0 && res_index1 >= 0)
    puts str1[res_index1] if table[res_index1][res_index2] > 0
    res_index2 -= 1
    res_index1 -= 1
  end  
end  

# str1 = "GeeksforGeeks"
# str2 = "GeeksQuiz"

str1 = "abcdxyz"
str2 = "xyzabcd"
lcs(str1, str2)