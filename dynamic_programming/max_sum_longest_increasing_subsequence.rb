class DP
  attr_reader :len, :arr
  attr_accessor :lis

  def initialize(arr)
    @arr = arr
    @len = arr.length
    @lis = Array.new(len, 0)
  end

  # time compexity - o(n^2)
  # space - o(n)
  def find_max_sum_lis
    self.lis[0] = arr[0]; i = 1
    while(i < len)
      j = 0
      while (j < i)
        if(arr[i] > arr[j])
          lis[i] = [arr[i] + lis[j], arr[i]].max
        else
          lis[i] = [arr[i], lis[i].to_i].max
        end
        j += 1  
      end
      i += 1
    end

    p lis.max  
  end  
end

arr = [1, 101, 2, 3, 100, 4, 5]
obj = DP.new(arr)  
obj.find_max_sum_lis