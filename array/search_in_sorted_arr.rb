def find_rotational_point(arr, low, hi)

  if low > hi
    return -1
  end  

  if low == hi
    return low
  end
  
  mid = (low+hi)/2

  if arr[mid] > arr[mid+1]
    return mid
  end  

  if arr[mid] < arr[mid-1]
    return mid-1
  end

  if(arr[low] >= arr[mid])
    find_rotational_point(arr, mid + 1, hi)
  end  

  find_rotational_point(arr, low, mid - 1)
end 

arr = [5, 6, 7, 8, 9, 10, 1, 2, 3]
low = 0
hi = arr.length-1
k = 10

# arr = [4,5,1,2,3]
# low = 0
# hi = 4

puts find_rotational_point(arr, low, hi)
# puts search(arr, low, hi, k)