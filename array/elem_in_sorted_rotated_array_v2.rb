def rotation_point(low, hi, arr)

  if low > hi
    return -1
  end

  mid = (low+hi)/2 

  if mid < hi && arr[mid] > arr[mid+1]
    return mid
  end

  if mid > low && arr[mid] < arr[mid-1]
    return mid-1
  end 

  if arr[low] <= arr[mid]
    rotation_point(mid+1, hi, arr)
  else
    rotation_point(low, mid-1, arr)  
  end  

end  


def search_key(arr, key)
  n = arr.length
  pivot = rotation_point(0, n, arr)
  low = pivot + 1
  hi = low + (n-1)
  while(low <= hi)
    mid = (low+hi)/2
    indx = mid%n
    if(arr[indx] == key)
      return mid%n
    elsif key < arr[indx]
      hi = mid - 1
    else
      low = mid + 1
    end  
  end  
  return -1
end  
arr = [4,5,1,2,3]
key = 2

arr = [5, 6, 7, 8, 9, 10, 1, 2, 3]
key = 10
puts search_key(arr, key)
# puts rotation_point(0, arr.length, arr)

