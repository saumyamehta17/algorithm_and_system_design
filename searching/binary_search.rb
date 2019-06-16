def binary_search(arr, low, hi, val)
  if low > hi
    raise 'Limits reversed'
  end
  
  loop do
    if arr[low] > arr[hi]
      raise 'Array not sorted'
    end

    center = (low + hi) / 2
    if (low == hi && arr[center] != val)
      raise 'Element not found'
    end

    if arr[center] == val
      puts "#{val} Found at #{center}"
      return
    elsif val > arr[center]
      low = center + 1
    else
      hi = center - 1
    end  
  end  
end

# arr = [10,20,21,35,40,88,90]
arr = [88,12,90,100]
binary_search(arr, 0, arr.length-1, 88)