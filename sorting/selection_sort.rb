# first comparsion takes o(n-1)
# second comparsion takes o(n-2)
# third comparsion takes o(n-3) and so on
# it becomes n(n-1)/2 i.e o(n2). and its not stable
def selection_sort(arr, start)

  len = arr.length
  if start < len - 1
    swap(arr, start, len, find_min(arr, start, len))    
    selection_sort(arr, start+1)
  end
  return arr  
end  


def find_min(arr, start, len)
  min_pos = start

  for i in (start+1)...len
    if arr[i] < arr[min_pos]
      min_pos = i
    end  
  end

  min_pos  
end  



def swap(arr, start, len, min_indx)
  if start != min_indx    
    temp = arr[start]
    arr[start] = arr[min_indx]
    arr[min_indx] = temp
  end  
end  




arr = [10,9,2,1,6,7]
puts selection_sort(arr, 0).to_s