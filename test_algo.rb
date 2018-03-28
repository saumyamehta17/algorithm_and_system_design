class MediaFromStream
  attr_accessor :min_heap, :max_heap

  def initialize
    @min_heap = []
    @max_heap = []
    @input = [5,15,1,3,2]
  end

  def start
    i = 0
    while(i < input.length)
      add_number(input[i])
      rebalance
      get_median
    end  
  end

  def add_number(num)
    if(max_heap.empty? || max_heap.first > num)
      max_heap.push(num)
    else
      min_heap.push(num)
      heapify_min
    end  
  end

  def rebalance
    big_heap   = max_heap.length > min_heap.length ? max_heap : min_heap
    small_heap = max_heap.length < min_heap.length ? max_heap : min_heap

    if (big_heap.length - small_heap.length) > 1
      small_heap.push(big_heap.pop)
    end  

    heapify_min
    heapify_max
  end
  
  def get_median
    big_heap   = max_heap.length > min_heap.length ? max_heap : min_heap
    small_heap = max_heap.length < min_heap.length ? max_heap : min_heap

    if(big_heap.length == small_heap.length)
      return (big_heap.first + small_heap.first)/2
    else
      return big_heap.first
    end  
  end

  def heapify_min
    low = 0; hi = min_heap.length
    indx = (low+hi)/2-1
    while(indx >= 0)
      while(1)
        smallest = indx
        lindex = indx*2+1
        rindex = indx*2+2
        if(min_heap[lindex] < smallest)
          smallest = lindex
        end

        if(min_heap[rindex] < smallest)
          smallest = rindex
        end

        if(indx != smallest)
          temp = min_heap[indx]
          @min_heap[indx] = min_heap[smallest]
          @min_heap[smallest] = temp
        end  
        return
      end
      indx -= 1  
    end

  end

  def heapify_max
    low = 0; hi = max_heap.length
    indx = (low+hi)/2-1
    while(indx >= 0)
      while(true)
        puts 's'
        largest = indx
        lindex = indx * 2 + 1
        rindex = indx * 2 + 2
        if(lindex < hi && max_heap[lindex] > max_heap[largest])
          largest = lindex
        end

        if(rindex < hi && max_heap[rindex] > max_heap[largest])
          largest = rindex
        end

        if(indx != largest)
          temp = max_heap[indx]
          @max_heap[indx] = max_heap[largest]
          @max_heap[largest] = temp
          return false
        end
        return true
      end
      indx -= 1  
    end  
  end



end  

md = MediaFromStream.new
md.max_heap = [2,3,4,10]
md.heapify_max
puts md.max_heap.to_s
