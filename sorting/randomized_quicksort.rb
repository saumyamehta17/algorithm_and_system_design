def sort(low, hi, arr)

  if(low < hi)
    random_index = (low..hi).to_a.sample
    swap(random_index, hi, arr)
    p_index = find_pivot(low, hi, arr)
    sort(low, p_index - 1, arr)
    sort(p_index + 1, hi, arr)
  end
  arr    
end

def swap(i, j, arr)
  temp = arr[i]
  arr[i] = arr[j]
  arr[j] = temp
end  

def find_pivot(low, hi, arr)
  pivot_elem = arr[hi]
  i = j = low

  while(i < hi)

    if(arr[i] <= pivot_elem)
      swap(i, j, arr) if i != j
      j += 1
    end
    
    i += 1  
  end 
  swap(i, j, arr) if i != j
  j 
end  


arr = [2,5,6,90,100,101, 3]
puts arr.to_s
arr = sort(0, arr.length-1, arr)  
puts arr.to_s
