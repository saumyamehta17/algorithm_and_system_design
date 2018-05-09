def largest_subarray(arr)
  max = 0
  sum = 0
  hsh = {}

  for i in 0...arr.length

    sum += arr[i]
    if hsh[sum]
      temp_max = i - hsh[sum]
      max = [temp_max, max].max
    else
      hsh[sum] = i
    end  
  end

  max
end  


# arr = [15, -2, 2, -8, 1, 7, 10, 23]
arr = [1, 2, 3]
arr = [1, 0, 3]
puts largest_subarray(arr)