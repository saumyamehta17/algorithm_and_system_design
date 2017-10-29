require 'pry'
class HeapSort
  attr_accessor :array, :length

  def initialize(array)
    @array = array
    @length = @array.length
  end  

  def sort_me
    print array
    print "\n"
    # getting rightmost element at second last height 
    index = (length/2 - 1)

    # building ordred tree as binary heap
    while(index >= 0)
      heapify(index) 
      index -= 1
    end  

    index = length - 1
    # now sorting
    while(index > 0)
      swap(0, index)
      heapify(0, index)
      index -= 1
    end

    array
  end  

  def heapify(indx, n = length)
    lindex = indx * 2 + 1
    rindex = indx * 2 + 2
    largest = indx
    puts "index is #{largest}"
    puts "Lindex is #{lindex}"
    puts "Rindex is #{rindex}"

    if (lindex < n && array[largest] < array[lindex])
      largest = lindex
    end  
    if (rindex < n && array[largest] < array[rindex])
      largest = rindex
    end
    
    if largest != indx
      swap(indx, largest)
      heapify(largest,n)
      print array
      print "\n"
    end  
  end  

  def swap(indx1, indx2)
    tmp = array[indx1]
    array[indx1] = array[indx2]
    array[indx2] = tmp
  end  

  def self.exec_me
    # h = HeapSort.new([29,8,12,34,55,2,7])
    h = HeapSort.new([15, 19, 10, 7, 17, 16])
    h.sort_me
    print h.array
  end  
end 

HeapSort.exec_me