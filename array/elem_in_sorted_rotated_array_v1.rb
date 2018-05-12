def search(arr, l, h, key)
  if(l > h)
    return -1
  end

  mid = (l+h)/2

  if(arr[mid] == key)
    return mid
  end

  if(arr[l] <= arr[mid-1])  
    if(key <= arr[mid-1] && key >= arr[l])
      search(arr, l, mid-1, key)
    else
      search(arr, mid+1, h, key)
    end  
  else
    if(key <= arr[h] && key >= arr[mid+1])
      search(arr, mid+1, h, key)
    else
      search(arr, l , mid-1, key)
    end  
  end  
end  
arr = [4, 5, 6, 7, 8, 9, 1, 2, 3]
key = 6

arr = [5,7,8,10,1,2]
key = 1
l = 0; h = arr.length-1; 
_index = search(arr, l, h, key)
if(_index == -1)
  puts "No Index found"
else
  puts "Value is at #{_index}"
end  