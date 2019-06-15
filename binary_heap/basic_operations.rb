def insert(val)
  @minheap << val
  indx = @minheap.length - 1
  insert_and_heapify(indx)
end

def insert_and_heapify(indx)
  while(indx > 0)
    parent_indx = (indx - 1)/2
    if(@minheap[parent_indx] > @minheap[indx])
      swap(parent_indx, indx)
      indx = parent_indx
    else
      return
    end  
  end 
end  

def delete(indx)
  if @minheap[indx]
    n = @minheap.length
    @minheap[indx] = @minheap[n-1]
    @minheap.pop
    heapify(indx, n-1)
    return 1
  else
    return -1
  end  
end  

def heapify(indx, size)
  smallest = indx
  lindx = indx * 2 + 1
  rindx = indx * 2 + 2

  if lindx < size && @minheap[smallest] > @minheap[lindx]
    smallest = lindx
  end  

  if rindx < size && @minheap[smallest] > @minheap[rindx]
    smallest = rindx
  end

  if smallest != indx
    swap(smallest, indx)
    heapify(smallest, size)
  end  
end 

def extractMin
  n = @minheap.length
  if n == 0
    return -1
  else n >= 1
    ouput = @minheap[0]
    if n == 1
      @minheap.pop
    else
      @minheap[0] = @minheap[n-1]
      @minheap.pop
    end
    heapify(0, n-1) 
    return ouput
  end  
end 

def getMin
  @minheap[0]
end  

def decreaseKey(key, val)
  if @minheap[key]
    @minheap[key] = val
    insert_and_heapify(key)
  else
    return -1
  end  
end 

def swap(i,j)
  tmp = @minheap[j]
  @minheap[j] = @minheap[i]
  @minheap[i] = tmp
end 



@minheap = Array.new
insert(3)
insert(2)
delete(1)
insert(15)
insert(4)
insert(45)
puts extractMin
puts getMin
decreaseKey(2, 1)
puts getMin