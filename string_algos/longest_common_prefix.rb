# longest common prefix
# time complexity is o(mn) as we are comparing each char to other char in worst case
# space - storing res will take o(m)
def lcp_char_by_char(arr)
  n = arr.length
  min_length = arr[0].length
  i = 1
  while(i < n)
    min_length = [min_length, arr[i].length].min
    i += 1
  end

  i = 0; res = ''
  while(i < min_length)
    prefix = arr[0][i]
    j = 1
    while(j < n)
      if(arr[j][i] != prefix)
        return res
      end
      prefix = arr[j-1][i]
      j += 1
    end
    res = res + arr[j-1][i]  
    i += 1  
  end
  res  
end

arr = ['apple', 'april', 'ape']
puts lcp_char_by_char(arr)  