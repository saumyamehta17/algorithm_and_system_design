def coin_change(arr, n, sum)
  mtrx = Array.new(n){Array.new(sum+1)}
  mtrx[0][0] = 0
  for i in 1...n
    mtrx[i][0] = 1
  end

  for i in 1...(sum+1)
    mtrx[0][i] = 1
  end

  # puts mtrx.to_s
  for i in 1...n
    for j in 1...(sum+1)
      if(j < arr[i])
        mtrx[i][j] = mtrx[i-1][j]
      else
        mtrx[i][j] = mtrx[i-1][j] + mtrx[i][j-arr[i]]
      end  
    end
  end    

  puts mtrx[n-1][sum]
end  

arr = [1,2,3]
arr = [6]
n = arr.length
sum = 5
coin_change(arr, n, sum)