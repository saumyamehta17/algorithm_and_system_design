def largestMountain(arr)
  n = arr.length
  len = 0
  for which in 1...(n-1)
    left = which - 1
    right = which + 1
    if arr[left] < arr[which] && arr[which] > arr[right]
      locallen = 3
      locallen, right = explore(locallen, arr, left, right, n)
      len = [locallen, len].max
      which = right + 1
    end  
  end
  puts len  
end  

def explore(len, arr, left, right, n)
  while(left > 0 && arr[left] > arr[left-1])
    left -= 1
    len += 1
  end
  
  while(right < n-1 && arr[right] > arr[right+1])
    right += 1
    len += 1
  end 
  [len, right] 
end  

arr = [10,1,2,5,3,1,11,10,9,8,7,14]
arr = [2,1,4,7,3,2,5]
arr = [2,2,2]
largestMountain(arr)