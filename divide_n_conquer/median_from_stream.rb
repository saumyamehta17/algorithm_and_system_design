class MediaFromStream
  attr_accessor :min_heap, :max_heap, :input

  def initialize
    @min_heap = []
    @max_heap = []
    # @input = [5,15,1,3,2]
    @input = [5, 15, 1, 3, 2, 8, 7, 9, 10, 6, 11, 4]
  end

  def start
    i = 0
    while(i < input.length)
      add_number(input[i])
      rebalance
      puts "median for #{input[0..i]} is #{get_median}"
      i += 1
    end  
  end

  def add_number(num)
    if(max_heap.empty? || max_heap.first > num)
      max_heap.push(num)

    else
      min_heap.push(num)
      heapify_min if num > min_heap.first
    end
  end

  def rebalance
    # big_heap   = max_heap.length > min_heap.length ? max_heap : min_heap
    # small_heap = max_heap.length > min_heap.length ? min_heap : max_heap

    # if (big_heap.length - small_heap.length) > 1
    #   small_heap.push(big_heap.pop)
    # end  
    
    if (max_heap.length - min_heap.length).abs > 1
      if min_heap.length > max_heap.length
        @max_heap.push(min_heap.shift)
      else
        @min_heap.push(max_heap.shift)
      end  
    end  
    # puts "B minheap is #{min_heap.to_s} "
    # puts "B maxheap is #{max_heap.to_s} "
    heapify_min
    # puts "minheap is #{min_heap.to_s} "
    heapify_max
    # puts "maxheap is #{max_heap.to_s} "
  end
  
  def get_median
    big_heap   = max_heap.length > min_heap.length ? max_heap : min_heap
    small_heap = max_heap.length > min_heap.length ? min_heap : max_heap

    if(big_heap.length == small_heap.length)
      return (big_heap.first + small_heap.first)/2
    else
      return big_heap.first
    end  
  end

  def heapify_min
    low = 0; hi = min_heap.length
    if hi == 2
      _min = min_heap.min
      _max = min_heap.max
      @min_heap[low] = _min
      @min_heap[hi-1] = _max
      return
    end  
    indx = (low+hi)/2-1
    while(indx >= 0)
      while(1)
        smallest = indx
        lindex = indx*2+1
        rindex = indx*2+2
        if(lindex < hi && min_heap[lindex] < min_heap[smallest])
          smallest = lindex
        end

        if(rindex < hi && min_heap[rindex] < min_heap[smallest])
          smallest = rindex
        end
        if(indx != smallest)
          temp = min_heap[indx]
          @min_heap[indx] = min_heap[smallest]
          @min_heap[smallest] = temp
        else
          break  
        end  
      end
      indx -= 1  
    end

  end

  def heapify_max
    low = 0; hi = max_heap.length
    if hi == 2
      _min = max_heap.min; _max = max_heap.max
      @max_heap[low] = _max
      @max_heap[hi-1] = _min
      return
    end
    indx = (low+hi)/2-1
    while(indx >= 0)
      while(1)
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
        else
          break
        end
      end
      indx -= 1  
    end  
  end



end  

md = MediaFromStream.new
md.start

