require 'pry'

class QuickSort
  attr_accessor :arr, :low_index, :high_index, :pivot_index

  def initialize(arr)
    @arr = arr
    @low_index = 0
    @high_index = arr.length - 1
    @pivot_index = @high_index
  end

  def swap(i, j)
    temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
  end 

  # keep j index on greater elem that pivot and swap as soon u find smaller
  # if swap happend, it mean list gathered one more elem on left that is less than pivot and 
  # move greater elem at right that is greater than pivot
  # at last swap pivot with j

  def process_pivot(low_index, high_index)
   
   pivot = arr[high_index]
   i = 0
   j = 0

   while(i < high_index)
    if(arr[i] <= pivot)
      swap(i, j) unless i == j
      j += 1
    end  
    i += 1

   end 
   swap(high_index, j)
   return j  
  end

  # Quick Sort - pick a pivot element that can be last, first, any random, or any median element
  # each pass will place pivot at correct position
  def quick_sort(low_index = @low_index, high_index = @high_index)
    if(low_index < high_index)
      pivot_position = process_pivot(low_index, high_index)
      quick_sort(low_index, pivot_position - 1)
      quick_sort(pivot_position + 1, high_index)
    end
  end

end  

  

arr = [100, 80, 20, 90, 40, 50, 60]
qs = QuickSort.new(arr)
qs.quick_sort
print qs.arr

# Complexity
# two recursion + one iteriation
# T(k) + T(n-k-1) + theta(n) where k is pivot pos
# 