class Stream
  attr_reader :min_heap, :count, :k

  def initialize(k)
    @k = k
    @min_heap = Array.new(k)
    @count = 0
  end

  def find_kth_largest
    while(1)
      puts "Enter value"
      val = gets.chomp.to_i

      if count < k-1
        build_heap(val)
        puts "Not found kth largest"
      elsif count == k-1
        build_heap(val)
        heapify
        puts "Kth largest is #{min_heap[0]}"
      else
        if val > min_heap[0]
          @min_heap[0] = val
          heapify
          puts min_heap.to_s
          puts "Kth largest is #{min_heap[0]}"
        end
      end    
    end
  end

  def build_heap(val)
    @min_heap[count] = val
    @count += 1
  end

  def heapify
    indx = (k-1)/2
    while(indx >= 0)
      lindx = indx*2+1
      rindx = indx*2+2
      smallest = indx
      if lindx < k && min_heap[lindx] < min_heap[smallest]
        smallest = lindx
      end  
      if rindx < k && min_heap[rindx] < min_heap[smallest]
        smallest = rindx
      end
      if smallest != indx
        swap(smallest, indx)
      end
      indx -= 1  
    end
  end  

  def swap(indx1, indx2)
    tmp = min_heap[indx1]
    @min_heap[indx1] = min_heap[indx2]
    @min_heap[indx2] = tmp
  end  
end  

s = Stream.new(5)
s.find_kth_largest