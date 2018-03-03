def sort_by_frequency(arr, low , hi)
  i = 0
  hsh = {}
  while(i <= hi)
    hsh[arr[i]] = hsh[arr[i]] ? hsh[arr[i]] + 1 : 1
    i += 1
  end
  #copy to 2D array  
  arr1 = []
  hsh.each do |key,val|
    arr1 << [val, key]
  end

  arr = qsort(arr1, low, arr1.length-1)
      
  arr.each do |element|
    element[0].times{|x| print "#{element[1]} "}
  end  
end  

def qsort(arr, low, hi)
  if(low < hi)
    pivot_index = process(arr, low, hi)
    qsort(arr, low, pivot_index-1)
    qsort(arr, pivot_index+1, hi)
  end
  arr
end

def process(arr, low, hi)  
  i = j = low
  pivot = arr[hi][0]

  while(i < hi)
    if(arr[i][0] > pivot)
      swap(arr,i,j) if i != j
      j += 1
    end
    i += 1  
  end
  swap(arr,i, j) if i != j
  j  
end

def swap(arr,i,j)
  tmp = arr[i]
  arr[i] = arr[j]
  arr[j] = tmp
end  

arr = [2, 5, 2, 8, 5, 6, 8, 8]
low = 0; hi = arr.length-1
puts "Before-- " + arr.to_s
sort_by_frequency(arr, low , hi)