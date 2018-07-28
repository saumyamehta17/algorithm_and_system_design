require 'pry'
class MinHeap
  attr_reader :size, :arr

  def initialize
    @arr = []
  end

  def parent(indx)
    (indx - 1)/2
  end  

  def insert(val)
    arr << val
    indx = arr.length-1
    while(indx != 0 && arr[indx] < arr[parent(indx)])
      i = parent(indx)
      temp = arr[i]
      arr[i] = arr[indx]
      arr[indx] = temp
      indx = i
    end  
  end

  def heapify(indx)
    len = arr.length
    smaller = indx
    lindx = indx*2+1
    rindx = indx*2+2
    if(lindx < len && arr[lindx] < arr[smaller])
      smaller = lindx
    end
    if(rindx < len && arr[rindx] < arr[smaller])  
      smaller = rindx
    end

    if(indx != smaller)
      temp = arr[indx]
      arr[indx] = arr[smaller]
      arr[smaller] = temp
      heapify(smaller)
    end  
  end

  def get_min
    arr[0]
  end

  def extract
    puts "extracted #{arr[0]}"
    len = arr.length
    arr[0] = arr[len-1]
    arr.pop
    heapify(0)
  end 

  def delete(key)
    len = arr.length
    return -1 if(key >= len)
    arr[key] = arr[len-1]
    arr.pop
    heapify(key)
  end 
end   

heap = MinHeap.new
heap.insert 4
heap.insert 2
heap.insert 6
heap.insert 3
heap.insert 1
puts "Before extraction array is.. #{heap.arr.to_s}"
puts "Min is #{heap.get_min}"
heap.extract
puts "After extraction array is.. #{heap.arr.to_s}"
heap.delete(1)
puts "After delete array is.. #{heap.arr.to_s}"