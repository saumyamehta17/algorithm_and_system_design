def sort_now(arr)
  n = arr.length

  lo = 0; mid = 0; hi = n-1

  while(mid <= hi)
    case(arr[mid])
      when 0
        swap(arr, lo, mid) if arr[lo] != arr[mid]
        lo += 1; mid += 1
      when 1
        mid += 1
      when 2
        swap(arr, hi, mid) if arr[hi] != arr[mid]
        hi -= 1     
    end
  end

  print arr  
end 

def swap(arr, index1, index2) 
  tmp = arr[index1]
  arr[index1] = arr[index2]
  arr[index2] = tmp
end  


arr = [0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1]
sort_now(arr)
# outpur should be [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2]