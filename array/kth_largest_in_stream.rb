class KthLargestElem
  attr_accessor :k, :arr, :count

  def initialize(k)
    @k = k
    @count = 0
    @arr = Array.new(k)
  end

  def self.start(k)
    puts "Lets start................"
    obj = KthLargestElem.new(k)
    obj.process
  end

  def process
    while(1)
      puts "Enter an element"
      val = gets.chomp.to_i
      if(count < k-1)
        build_heap(val)
      else
        if(count == k-1)
          build_heap(val)
          heapify
        else
          if(val > arr[0])
            @arr[0] = val
            heapify
          end    
        end
        puts "#{k}th largest is #{arr[0]}"  
      end    
    end  
    
  end

  def build_heap(val)
    @arr[count] = val
    @count += 1
  end 

  def heapify
    index = k/2-1
    while(index >= 0)

      # heapifing
      while(1)
        lindex = index*2+1
        rindex = index*2+2
        smallest = index

        if(arr[lindex] < arr[smallest])
          smallest = lindex
        end
        
        if(arr[rindex] < arr[smallest])
          smallest = rindex
        end

        if(smallest != index)
          swap(smallest, index)
        end  
        return
      end  

      index -= 1
    end  
  end

  def swap(index1, index2)  
    temp = arr[index2]
    @arr[index2] = arr[index1]
    @arr[index1] = temp 
  end  
end  

k = 3
KthLargestElem.start(k)