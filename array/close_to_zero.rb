def find_two_elem_close_to_zero(arr)
  n = arr.length
  low = 0
  _end = n - 1
  puts arr
  arr = sort(arr, 0, n-1)
  puts "After Sorting"
  puts arr

  min_sum = 99999
  min_l = arr[low]
  min_r = arr[_end]

  while(low <= _end)
    curr_sum = arr[low] + arr[_end]
    if curr_sum.abs < min_sum.abs
      min_sum = curr_sum
      min_l = low
      min_r = _end
    end

    if curr_sum < 0
      low += 1
    else
      _end -= 1
    end    
  end

  puts "two no are #{arr[min_l]} and #{arr[min_r]}"  

end  

def get_pivot(arr, low, hi)
  pivot = arr[hi]
  i = low
  j = low
  while(i < hi)
    if arr[i] < pivot
      temp = arr[i]
      arr[i] = arr[j]
      arr[j] = temp
      j += 1
    end
    i += 1  
  end
  arr[hi] = arr[j]
  arr[j] = pivot
  j  
end

def sort(arr, low , hi)
  if low < hi
    pivot_index = get_pivot(arr, low, hi)
    sort(arr, low, pivot_index -1)
    sort(arr, pivot_index + 1, hi)
  end
  arr  
end  

arr = [-10, -5, -1, 8, 9, 11]
find_two_elem_close_to_zero(arr)