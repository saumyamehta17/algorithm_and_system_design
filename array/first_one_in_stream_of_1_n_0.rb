def find_one(arr, low, hi)
  while(low < hi)
    mid = (low+hi)/2

    if(arr[mid] == 0 && arr[mid+1] == 1)
      return mid+1
    elsif arr[mid] == 1 && arr[mid-1] == 0
      return mid
    elsif arr[mid] == 0
      low = mid+1
    elsif arr[mid] == 1
      hi = mid-1
    end  
  end

  return -1  
end  

arr = [0, 0, 0, 0, 0, 0, 1, 1, 1, 1]
arr = [0, 0, 0, 0, 0, 0]
puts find_one(arr, 0, arr.length)