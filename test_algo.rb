def count_dst(arr, k)
  n = arr.length
  return -1 if k >= n-1
  dst = 0
  hsh = {}
  for i in 0...k
    if hsh[arr[i]]
      hsh[arr[i]] = hsh[arr[i]] + 1
    else
      hsh[arr[i]] = 1
      dst += 1
    end
  end
  puts "#{dst} "
  for i in k...n
    if hsh[arr[i-k]] > 1
      hsh[arr[i-k]] -= 1
    else
      hsh[arr[i-k]] = nil
      dst -= 1
    end

    if hsh[arr[i]] 
      hsh[arr[i]] += 1
    else
      hsh[arr[i]] = 1
      dst += 1
    end
    puts "#{dst} "
  end      
end  

arr = [1, 2, 1, 3, 4, 2, 3]  
k = 4
count_dst(arr, k)