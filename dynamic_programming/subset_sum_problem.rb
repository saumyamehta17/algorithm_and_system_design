# time complexity is exponential
def subset_sum_prblm(arr, n, sum)

  if(sum == 0)
    return true
  end

  if(n == 0 && sum != 0)
    return false
  end

  if(arr[n-1] > sum)  
    subset_sum_prblm(arr, n-1, sum)
  end

  return subset_sum_prblm(arr, n-1, sum) || 
         subset_sum_prblm(arr, n-1, sum-arr[n-1])   
end  

arr = [3, 34, 4, 12, 5, 2]
arr = [1,2,3]
n = arr.length
sum = 9
# puts subset_sum_prblm(arr, n, sum)

# using DP

def subset_sum_prblm_using_dp(arr, n, sum)
  mtrx = Array.new(n+1) {Array.new(sum+1, false)}

  mtrx[0][0] = true
  for i in 1...(n+1)
    mtrx[i][0] = true
  end

  for i in 1...(sum+1)
    mtrx[0][i] = false
  end
  puts mtrx.to_s
  for i in 1...(n+1)  
    for j in 1...(sum+1)
      mtrx[i][j] = mtrx[i-1][j]

      if(mtrx[i][j] == false)
        if(j < arr[i-1])
          mtrx[i][j] = false
        else
          mtrx[i][j] = mtrx[i-1][arr[i-1] - j]
        end  
      end  

    end
  end

  puts mtrx[n][sum]    
end  

arr = [3, 34, 4, 12, 5, 2]
arr = [1,2,3]
n = arr.length
sum = 9
subset_sum_prblm_using_dp(arr, n, sum)

