require 'pry'
class CountingSort
  attr_reader :arr, :count_arr, :output_arr, :len

  def initialize(arr)
    @arr = arr
    @len = arr.size
    @count_arr = Array.new(10, 0)
    @output_arr = Array.new(len)
  end  

  def start

    i = 0
    # count each digit occured and save in count array
    while(i < len)
      val = arr[i]
      count_arr[val] += 1
      i += 1
    end

    i = 1
    # defining at what positions each element will start
    while(i < 9)
      count_arr[i] = count_arr[i] + count_arr[i-1]
      i += 1
    end  

    i = 0
    # val = take value from arr
    # use val to find index where output arr will keep val
    while(i < len)
      val = arr[i]
      indx = count_arr[val]
      output_arr[indx] = val
      count_arr[val] -= 1
      i += 1
    end  

  end  
end

@cs = CountingSort.new([1,4,1,2,7,5,2])
@cs.start
puts @cs.output_arr


