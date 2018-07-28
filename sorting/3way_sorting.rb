def partition(arr, low, hi)
  mid = low
  pivot_elem = arr[hi]
  while(mid <= hi)

    if(pivot_elem > arr[mid])
      swap(arr, low, mid)
      low += 1
      mid += 1
    elsif pivot_elem < arr[mid]
      swap(arr, mid, hi)
      hi -= 1
    else # is arr[mid] == pivot_elem
      mid += 1
    end
  end
  [low-1, mid]  
end  

def swap(arr, index1, index2)
  temp = arr[index1]
  arr[index1] = arr[index2]
  arr[index2] = temp
end  

def three_way_quick(arr, low, hi)  
  puts "#{low} -- #{hi}"
  if(low < hi)

    i, j = partition(arr, low, hi)
    
    three_way_quick(arr, low, i)
    three_way_quick(arr, j, hi)
  end  
end

arr = [9,1,1,4,9,4,1,4]
arr = [9,2,4,9,2,4]
low = 0
hi = arr.length - 1
puts arr.to_s
three_way_quick(arr, low, hi)    
puts arr.to_s