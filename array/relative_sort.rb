#using binary search

def relative_sort_v2(a1, a2, n1, n2)

  #copy elems from a1 to tmp
  tmp_arr = Array.new(n1)
  for i in 0...n1
    tmp_arr[i] = a1[i]
  end

  #visited array
  visited = Array.new(n1, false)

  #sort tmp
  tmp_arr = tmp_arr.sort

  #traverse a2
  indx = 0
  for i in 0...n2
    elem = a2[i]
    f = find_first(0, n1, elem, tmp_arr)
    next if f == -1
    while(f < n1 && tmp_arr[f] == elem)
      a1[indx] = tmp_arr[f]
      visited[f] = true
      indx += 1
      f += 1
    end  
  end

  # copy left over elem in tmp
  for i in 0...n1
    if visited[i] == false
      a1[indx] = tmp_arr[i]
      indx += 1
    end  
  end 
  puts a1.to_s 
end

def find_first(low, hi, elem, arr)
  while(low < hi)
    mid = (low+hi)/2
    if (arr[mid] == elem && arr[mid-1]) || mid == 0 
      return mid
    elsif arr[mid] > elem
      hi = mid - 1
    else
      low = mid + 1
    end    
  end
  return -1  
end  


# using hasing...
def relative_sort(a1, a2)
  hsh = {}
  a1.each do |a|
    hsh[a] = hsh[a] ? hsh[a] + 1 : 1
  end  

  k = 0
  a2.each do |a|
    if(hsh[a])
      i = 0
      while(i < hsh[a])
        a1[k] = a
        i += 1; k += 1
      end
      hsh.delete(a)  
    end  
  end

  hsh.keys.sort.each do |key|
    i = 0
    while(i < hsh[key])
      a1[k] = key
      i += 1; k += 1
    end  
  end

  puts "After Relative Sorting.."
  puts a1.to_s  
end  
a1 = [2, 1, 2, 5, 7, 1, 9, 3, 6, 8, 8]
a2 = [2, 1, 8, 3]
puts "Before Sorting..."
puts a1.to_s
puts a2.to_s
# relative_sort(a1, a2)
relative_sort_v2(a1, a2, a1.length, a2.length)
