def binary_search(arr, low, hi, val)
  while(low <= hi)
    mid = (low + hi)/2
    if(val == arr[mid])
      puts "#{val} Found at #{mid}"
      return
    elsif (val > arr[mid])
      low = mid + 1
    elsif (val < arr[mid])
      hi = mid - 1
    end
  end  
  puts "Not Found"
end

arr = [10,20,21,35,40,88,90]
binary_search(arr, 0, arr.length-1, 88)