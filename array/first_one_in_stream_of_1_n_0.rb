def first_one(arr, low, hi)
  if(hi == 1 && arr[low] == 1)
    return low
  end  
  if(low < hi)
    mid = (low+hi)/2

    if(arr[mid] == 1 && arr[mid-1] == 0 )
      return mid
    elsif arr[mid] == 0 && arr[mid+1] == 1
      return mid+1 
    elsif arr[mid] == 0
      first_one(arr, mid+1, hi)
    elsif arr[mid] == 1
      first_one(arr, low, mid-1)
    end  
  end  
  return -1  
end

# arr = [0,0,0,1,1]
# arr = [0, 0, 0, 0, 0, 0, 1, 1, 1, 1]
arr = [1]
puts first_one(arr, 0, arr.length)
