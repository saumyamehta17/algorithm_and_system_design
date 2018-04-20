require 'pry'
Node = Struct.new(:data, :next_index, :arr_index)

class KSortedArray
  attr_reader :min_heap, :output, :n, :k, :arr
  MAXINT = 4611686018427387903

  def initialize(n, k, arr)
    @arr = arr
    @n, @k = n, k
    @min_heap = Array.new(k) {Node.new}
    @output = Array.new(n*k)
  end

  def start
    k.times do |i|
      min_heap[i].data = arr[i][0] || MAXINT
      min_heap[i].next_index = 1
      min_heap[i].arr_index = i
      check_heap(i)
    end

    (n*k).times do |i|
      node = extract
      output[i] = node.data
      if node.next_index < n
        if min_heap[k-1].nil?
          min_heap[k-1] = Node.new  
        end  
        min_heap[k-1].data = arr[node.arr_index][node.next_index] || MAXINT
        min_heap[k-1].next_index = node.next_index+1
        min_heap[k-1].arr_index = node.arr_index
        check_heap(k-1)
      end

      i += 1  
    end
  end  

  def check_heap(indx)
    while(indx != 0)
      parent = (indx-1)/2
      if (min_heap[parent].data || MAXINT) < (min_heap[indx].data || MAXINT)
        break
      else
        heapify(parent)
        indx = parent
      end  
    end  
  end

  def heapify(indx)
    smallest = indx
    lindx = indx*2+1
    rindx = indx*2+2
    if !min_heap[smallest].nil?
      if(lindx < k &&  min_heap[rindx] && min_heap[lindx].data < min_heap[smallest].data)
        smallest = lindx
      end
      
      if(rindx < k && min_heap[rindx] && min_heap[rindx].data < min_heap[smallest].data)
        smallest = rindx
      end
    end  

    if(indx != smallest)
      temp = min_heap[indx]
      min_heap[indx] = min_heap[smallest]
      min_heap[smallest] = temp
      heapify(indx)
    else
      return
    end  
  end  

  def extract(n = min_heap.length)
    res = min_heap[0]
    min_heap[0] = min_heap[n-1]
    min_heap.pop
    heapify(0)
    res
  end 
end  
arr = [
  [2,4],
  [1,6],
  [3,8]
]

n = 3
k = 3

ks = KSortedArray.new(n ,k, arr)
ks.start



  

 





