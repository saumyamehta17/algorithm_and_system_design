require 'pry'
class QSort
  attr_accessor :arr1, :arr2, :n1, :n2

  def initialize(arr1, arr2)
    @arr1 = arr1
    @arr2 = arr2
    @n1 = arr1.length
    @n2 = arr2.length
  end

  def qsort(low, hi)
    if(low < hi)
      puts "Low and hi #{low} -- #{hi}"
      pivot_index = get_pivot(low, hi)
      qsort(low, pivot_index-1)
      qsort(pivot_index+1, hi)
    end  
  end 

  def get_pivot(low, hi)
    pivot = arr1[hi]
    index2 = search(pivot)

    i = low
    j = low

    while(i < hi) 
      index1 = search(arr1[i])

      # normal sorting
      if(index1 == -1 && index2 == -1)
        if(arr1[i] < pivot)
          swap(i,j) if i != j
          j += 1
        end
        i += 1  

      elsif((index1 == -1 && index2 > -1) || 
            (index1 > -1 && index2 == -1))
        swap(i,j) if i != j
        i += 1; j += 1
      else      
        if(index1 < index2)
          swap(i, j) if i != j
          j += 1
        end  
        i += 1
      end
    end
    swap(j, hi) if j != hi
    return j
  end 

  def swap(index1, index2)
    tmp = arr1[index1]
    arr1[index1] = arr1[index2]
    arr1[index2] = tmp
  end  

  def search(elem)
    i = 0
    while(i < n2)
      if(arr2[i] == elem)
        return i
      end  
      i += 1
    end
    return -1  
  end  
end  

a1 = [2, 1, 2, 5, 7, 1, 9]
a2 = [2, 5]
qs = QSort.new(a1, a2)
puts "Before Sorting"
puts qs.arr1.to_s
qs.qsort(0, a1.length-1)
puts "After Sorting"
puts qs.arr1.to_s