# A sorting algorithm is said to be stable if two objects with equal keys appear 
# in the same order in sorted output as they appear in the input array to be sorted. 
# ome sorting algorithms are stable by nature like Insertion sort, 
# Merge Sort, Bubble Sort, etc. And some sorting algorithms are not,
 # like Heap Sort, Quick Sort, etc
require 'pry'
class MergeSort
  attr_accessor :arr, :len

  def initialize(arr)
    @arr = arr
    @len = arr.length
  end

  # left index and right index
  def sort(low, hi)
    if(low < hi)
      mid = (low+hi)/2
      sort(low, mid)
      sort(mid+1, hi)
      mergesort(low, mid, hi)
    end  
  end

  def mergesort(low, mid, hi)  
    left_size = mid - low + 1
    right_size = hi - mid

    left_arr  = Array.new(left_size)
    right_arr = Array.new(right_size)
    i = 0; j = 0
    # copy from arr
    while(i < left_size)
      left_arr[i] = arr[low + i]
      i += 1
    end

    while(j < right_size)
      right_arr[j] = arr[mid + 1 + j]
      j += 1
    end

    i = 0; j = 0; k = low
    # compare and put back to arr
    while(i < left_size && j < right_size)
      if(left_arr[i] <= right_arr[j])
        self.arr[k] = left_arr[i]
        i += 1
      else
        self.arr[k] = right_arr[j]
        j += 1
      end
      k += 1  
    end

    # check remaining elemnts in tmp arrays if any
    while(i < left_size)
      self.arr[k] = left_arr[i]
      i += 1; k += 1
    end

    while(j < right_size)
      self.arr[k] = right_arr[j]
      j += 1; k += 1
    end
  end  
end  

arr = [12, 11, 13, 5, 6, 7]
ms = MergeSort.new(arr)
puts "Before Merge Sort"
puts ms.arr.to_s
ms.sort(0, ms.len - 1)
puts "After merge sort"
puts ms.arr.to_s