def find_smallest(arr, k, low = 0, hi = arr.length-1)

  if low <= hi
    pivot_indx = getPivot(arr, low, hi)
    if pivot_indx == k-1
      return arr[pivot_indx]
    elsif pivot_indx > k-1
      find_smallest(arr, k, low, pivot_indx-1)
    else
      find_smallest(arr, k, pivot_indx+1, hi)
    end  
  end  

end  

def getPivot(arr, low, hi)
  pi = arr[hi]
  i = j = low

  while(i <= hi)
    if arr[i] < pi
      swap(arr, i, j) if i != j
      j += 1
    end  
    i += 1
  end

  swap(arr, j, hi) if j != hi
  j
end

def swap(arr, i, j)
  tmp = arr[i]
  arr[i] = arr[j]
  arr[j] = tmp
end  

arr = [7,10,4,3,20,15]
k = 4
puts find_smallest(arr, k)
