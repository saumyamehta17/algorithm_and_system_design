class HeapSort
  attr_accessor :arr, :len

  def initialize(arr)
    @arr = arr
    @len = arr.length
  end

  def sort_me

    # taking right most index one level up from total height of tree
    index = len/2 - 1

    # converting into max heap, placing max elem at root
    while(index >= 0)
      heapify(index)
      index -= 1
    end

    index = len - 1
    while(index > 0)
      # placing max element at last index and shrinking size of array by 1 at each step.
      # In this way we largest element placed at last
      swap(0, index)
      puts arr.to_s
      # length will be 4, 3, 2 and so on..
      heapify(0, index)

      index -= 1
    end 
  end


  def swap(index1, index2)
    temp = arr[index1]
    arr[index1] = arr[index2]
    arr[index2] = temp
  end

  def heapify(indx, new_length = len)
    left_index = indx * 2 + 1
    right_index = indx * 2 + 2  
    largest_index = indx
    puts "left - #{left_index}, right - #{right_index}, Larg = #{largest_index}"

    if(left_index < new_length && arr[left_index] >= arr[largest_index])
      largest_index = left_index
    end

    if(right_index < new_length && arr[right_index] >= arr[largest_index]) 
      largest_index = right_index
    end

    if(largest_index != indx)
      swap(indx, largest_index)
      puts arr.to_s
      heapify(largest_index, new_length)
    end 
  end  
end  

arr = [4,10,3,5,1]
hs = HeapSort.new(arr)
puts "Before sort"
puts hs.arr.to_s
puts "--------------------------------"
hs.sort_me
puts "--------------------------------"
puts "After sort"
puts hs.arr.to_s