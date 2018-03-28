# The worst case time complexity of this method is O(n2), 
# but it works in O(n) on average
def get_pivot(arr, l , h)
  pivot = arr[h]
  i = j = l
  while(i < h)
    if(arr[i] <= pivot)
      swap(arr, i,j) if i != j
      j += 1
    end
    i += 1  
  end  
  swap(arr,i,j) if i != j
  j
end

def swap(arr, i , j)
  tmp = arr[i]
  arr[i] = arr[j]
  arr[j] = tmp
end  

def kth_smallest(arr, l, h, k)
  if(l < h)
    pivot_index = get_pivot(arr, l , h)
    if k == pivot_index
      return arr[pivot_index]
    elsif k < pivot_index
      kth_smallest(arr, l, pivot_index - 1, k)
    elsif k > pivot_index
      kth_smallest(arr, pivot_index + 1, h, k)
    else
      "Could not found"
    end  
  end
  # arr  
end  
arr = [12, 3, 5, 7, 4, 19, 26]
puts arr.to_s
puts "--------------***------------"
# arr = kth_smallest(arr, 0, arr.length-1, 3)
# puts arr.to_s

puts kth_smallest(arr, 0, arr.length-1, 3)