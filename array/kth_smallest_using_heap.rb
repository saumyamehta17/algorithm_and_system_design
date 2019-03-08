# Time complexity is o(logn)
def find_smallest(arr, k)
  n = arr.length
  counter = 0
  minheap = Array.new(n)

  # time o(n) and logn for each buildheap call
  # total o(nlogn)
  for i in 0...n
    build_heap(minheap, counter, arr[i])
    counter += 1
  end

  # o(k)
  # extract will take do heapify and each heapify will take o(logn)
  # total o(klogn)
  while(k > 1)
    extract(minheap, counter)
    k -= 1
  end  

  puts minheap[0]

end

def extract(arr, counter)
  arr[0] = arr[counter-1]
  counter -= 1
  heapify(arr, 0, counter)
end  

def heapify(arr, indx, counter)
  smallest = indx
  lindx = smallest*2+1
  rindx = smallest*2+2
  if lindx < counter && arr[smallest] > arr[lindx]
    smallest = lindx
  end  

  if rindx < counter && arr[smallest] > arr[rindx]
    smallest = rindx
  end  

  if smallest != indx
    swap(arr, smallest, indx)
    heapify(arr, smallest, counter)
  end  
end  

def build_heap(minheap, counter, val)
  minheap[counter] = val
  indx = counter
  while(indx > 0)
    parent_indx = (indx-1)/2
    if minheap[parent_indx] > minheap[indx]
      swap(minheap, parent_indx, indx)
      indx = parent_indx
    else
      return
    end  
  end  
end  

def swap(arr, i, j)
  tmp = arr[i]
  arr[i] = arr[j]
  arr[j] = tmp
end  

arr = [7,10,4,3,20,15]
k = 3
find_smallest(arr, k)