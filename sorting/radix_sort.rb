# it sort taking least significant digit to most significant digit

require 'pry'
class RadixSort
  attr_accessor :arr, :digit, :len

  def initialize(arr)
    @arr = arr
    @digit = 1
    @len = arr.length
  end

  def get_max
    i = 1
    largest = arr[0]
    while(i < len)
      if(largest < arr[i])
        largest = arr[i]
      end
      i += 1
    end
    largest
  end

  def start
    max = get_max
    while(max > 0)
      max = max/10
      sorting
      puts "digit is #{digit}"
      @digit = digit * 10
    end
  end

  def sorting
    count_arr = Array.new(10, 0)
    output_arr = Array.new(len)
    i = 0
    while(i < len)

      val = arr[i] / digit % 10
      count_arr[val] += 1
      i += 1
    end

    i = 1
    while(i < len)
      count_arr[i] = count_arr[i] + count_arr[i-1]
      i += 1
    end

    i = 0
    while(i < len)
      val = arr[i] / digit % 10
      indx = count_arr[val]
      output_arr[indx] = arr[i]
      count_arr[val] -= 1
      i += 1
    end
    # binding.pry
    output_arr.each_with_index do |v,i|
      arr[i] = output_arr[i+1]
    end
  end
end

@rs = RadixSort.new([101,4,1,2,7,5,2])
@rs = RadixSort.new([2,5,6,1,0])
@rs.start
puts @rs.arr.to_s