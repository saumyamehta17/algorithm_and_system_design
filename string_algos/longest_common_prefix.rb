# longest common prefix
# time complexity is o(mn) as we are comparing each char to other char in worst case
def lcp_char_by_char(str_arr)
  max = 0
  smallest_str_len = 4611

  for i in 0...str_arr.length
    smallest_str_len = [str_arr[i].length, smallest_str_len].min
  end  

  for i in 0...smallest_str_len
    val = str_arr[0][i]

    for j in 1...str_arr.length
      if str_arr[j][i] != val
        return str_arr[0][0...max]
      end  
    end

    max += 1
  end 

  return str_arr[0][0...max]
end  

str_arr = ["apple", "ape", "april"]
str_arr = ["geeksforgeeks", "geeks", "geek", "geezer"]
puts lcp_char_by_char(str_arr)  