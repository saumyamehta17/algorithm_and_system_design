def find_median_sorted_arrays(nums1, nums2)
   n = nums1.length
   m = nums2.length
    
   @min_heap = []
   @max_heap = [] 
   i = 0
   while(i < n)
    add_number(nums1[i])
    rebalance
    i += 1
   end

   i = 0
   while(i < m)
    add_number(nums2[i])
    rebalance
    i += 1
   end

   puts nums1.to_s
   puts nums2.to_s
   puts @min_heap.to_s
   puts @max_heap.to_s
   puts get_median
end

def add_number(number)
  if @max_heap.empty? || @max_heap.first > number
    @max_heap.push(number)
  else
    @min_heap.push(number)
    heapify_min if @min_heap.length > 1
  end    
end 

def rebalance
  if (@max_heap.length - @min_heap.length).abs > 1
    if(@min_heap.length > @max_heap.length)
      @max_heap.push(@min_heap.shift)
    else
      @min_heap.push(@max_heap.shift)
    end
  end

  heapify_min if @min_heap.length > 1
  heapify_max if @max_heap.length > 1 
end


def heapify_min
  low = 0; hi = @min_heap.length
   if hi == 2
     _min = @min_heap.min
     _max = @min_heap.max
     @min_heap[0] = _min
     @min_heap[1] = _max
     return
   end 

   _indx = (low + hi)/2 - 1
   while(_indx >= 0)

      while(1)
        smallest_indx = _indx
        left_indx = _indx * 2 + 1
        right_indx = _indx * 2 + 2

        if(left_indx < hi && @min_heap[smallest_indx] > @min_heap[left_indx])
           smallest_indx = left_indx
        end
        
        if(right_indx < hi && @min_heap[smallest_indx] > @min_heap[right_indx])
           smallest_indx = right_indx
        end

        if smallest_indx != _indx
          tmp = @min_heap[smallest_indx]
          @min_heap[smallest_indx] = @min_heap[_indx]
          @min_heap[_indx] = tmp
        else
          break  
        end  
      end
      _indx -= 1  
   end 
end

def heapify_max
  low = 0; hi = @max_heap.length
  if hi == 2
    _min = @max_heap.min
    _max = @max_heap.max
    @max_heap[0] = _max
    @max_heap[1] = _min
    return
  end

  _indx = (low + hi)/2 - 1
   while(_indx >= 0)

      while(1)
        largest_indx = _indx
        left_indx = _indx * 2 + 1
        right_indx = _indx * 2 + 2

        if(left_indx < hi && @max_heap[largest_indx] < @max_heap[left_indx])
           largest_indx = left_indx
        end
        
        if(right_indx < hi && @max_heap[largest_indx] < @max_heap[right_indx])
           largest_indx = right_indx
        end

        if largest_indx != _indx
          tmp = @max_heap[largest_indx]
          @max_heap[largest_indx] = @max_heap[_indx]
          @max_heap[_indx] = tmp
        else
          break  
        end
      end  
      _indx -= 1
   end
    
end    

def get_median
  min_heap_len = @min_heap.length
  max_heap_len = @max_heap.length

  if min_heap_len == max_heap_len
    return (@min_heap.first + @max_heap.first).to_f/2
  else
    if min_heap_len > max_heap_len
      return @min_heap.first
    else
      return @max_heap.first
    end  
  end  
end    

nums1 = [1,4,5]
nums2 = [3,9]

nums1 = [1, 2]
nums2 = [3, 4]

nums1 = [1,2,3,5,6,7]
nums2 = [4]
find_median_sorted_arrays(nums1, nums2)