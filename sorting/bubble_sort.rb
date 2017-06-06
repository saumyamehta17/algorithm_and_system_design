class BubbleSort
  attr_accessor :array, :length

  def initialize(array)
    @array = array
    @length = array.length
  end  

  def now_sort
    k = 0
    swapped = false

    while(k < length - 1)
      j = 0
      while(j < length  - 1)
        if(swap(j , j+1))
          swapped = true
        end  
        j += 1
      end

      k += 1  
      if (swapped == false)
         puts array
        return true
      end  
    end  
    puts array
  end

  def swap(index1, index2)
    if array[index1] > array[index2]
      tmp = array[index1]
      array[index1] = array[index2]
      array[index2] = tmp
      return true
    end 
    false
  end  
    

end  

BubbleSort.new([2,5,6,1,0]).now_sort