def equilibrium(arr)

  left_sum = 0
  right_sum = arr.reduce(:+)

  for i in 0...arr.length
    right_sum -= arr[i]
    if left_sum == right_sum
      return i+1
    end  
    left_sum += arr[i]
  end  
  return -1
end  

arr = [1,3,5,2,2]
arr = [-7, 1, 5, 2, -4, 3, 6]
puts equilibrium(arr)