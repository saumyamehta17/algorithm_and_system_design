def relative_sorting(a, b)
  n1 = b.length
  n2 = a.length
  j = 0

  for i in 0...n1
    for k in j...n2
      if a[k] == b[i]
        swap(a, k, j) if k != j
        j += 1
      end
      k += 1  
    end
    i += 1  
  end

  puts a.to_s  
  
  quick_sort(a, j, n2-1)

  puts a.to_s
end 

def quick_sort(a, low, hi)
  if low < hi
    pivot = find_pivot(a, low, hi)
    quick_sort(a, low, pivot - 1)
    quick_sort(a, pivot + 1, hi)
  end  
end  

def find_pivot(arr, low, hi)
  pivot = arr[hi]
  i = j = low
  while(i <= hi)
    if arr[i] < pivot
      swap(arr, i, j) if i != j
      j += 1
    end
    i += 1  
  end
  swap(arr, j, hi) if j != hi
  j  
end  

def swap(arr, k, j)
  temp = arr[k]
  arr[k] = arr[j]
  arr[j] = temp
end 

a = [2,1,2,5,7,1,9,3,6,8,8]
b = [2,1,8,3]
relative_sorting(a, b)