# using Recursion
def edit_distance_using_recursion(str1, str2, m, n)

  # if str2 is empty, mean we will remove all str1 chars so require n operations
  return n if(m == 0)

  # if str1 is empty, mean we will insert all str2 chars so require m operations
  return m if(n == 0)

  if(str1[m-1] == str2[n-1])
    # if last char of both str is same, then leave last char and explore rest length
    return edit_distance_using_recursion(str1, str2, m-1, n-1)
  else

    # 1. insert a char to str1 
    # 2. remove a char to str1
    # 2. replace a char in str1
    return [edit_distance_using_recursion(str1, str2, m, n-1),
            edit_distance_using_recursion(str1, str2, m-1, n),
            edit_distance_using_recursion(str1, str2, m-1, n-1)].min + 1  
  end
end


# Above have overlapping sub problems, and complexity is o(3^m) exponential
# Following is using DP - o(mxn)
def edit_distance_dp(str1, str2, m, n)

  mtrx = Array.new(m+1){Array.new(n+1)}

  mtrx[0][0] = 0

  for i in 1...m+1
    mtrx[i][0] = i
  end

  for i in 1...n+1
    mtrx[0][i] = i
  end

  for i in 1...m+1
    for j in 1...n+1

      if(str1[i-1] == str2[j-1])
        mtrx[i][j] = mtrx[i-1][j-1]
      else
        mtrx[i][j] = [mtrx[i-1][j-1], mtrx[i-1][j], mtrx[i][j-1]].min + 1
      end

    end
  end 

  puts mtrx[m][n]   

end  

str1 = "cat"
str2 = "cut"

str1 = "sunday"
str2 = "saturday"

# puts edit_distance_using_recursion(str1, str2, str1.length, str2.length)
edit_distance_dp(str1, str2, str1.length, str2.length)