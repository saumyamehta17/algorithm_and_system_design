# Find the element that appears once in a sorted array
# If we do iterative it will take o(n)
# Following will take log(n) by using binary search

def find_elem(low, hi, arr)
  if(low > hi)
    return
  end

  if(low == hi)  
    return arr[low]
  end

  mid = (low+hi)/2  

  # if even
  if(mid % 2 == 0)
    if(arr[mid] == arr[mid+1])
      find_elem(mid+2, hi, arr)
    else
      find_elem(low, mid - 1, arr)
    end
  # if ODD
  else
    if(arr[mid] == arr[mid+1])
      find_elem(low, mid-1, arr)
    else
      find_elem(mid+1, hi, arr)
    end  
  end
end

# arr = [1, 1, 3, 3, 4, 5, 5, 7, 7, 8, 8] # ouput - 4
arr = [1, 1, 3, 3, 4, 4, 5, 5, 7, 7, 8] #output - 8
low = 0; hi = arr.length - 1
puts find_elem(low, hi, arr)  

#iterative..
def appeard_once(arr)
  low = 0
  hi = arr.length-1
  while(low < hi)
    mid = (low+hi)/2
    if(mid % 2 == 0)

      if(arr[mid] == arr[mid+1])
        low = mid+2
      else
        hi = mid
      end  

    else

      if(arr[mid] == arr[mid+1])
        hi = mid-1
      else
        low = mid + 1
      end

    end  
  end

  puts arr[low]  
end  

arr = [1, 1, 3, 3, 4, 4, 5, 5, 7, 7, 8]
appeard_once(arr)