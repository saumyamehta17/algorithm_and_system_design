# Longest Subsequence Size
require 'pry'
class Prog

  attr_accessor :array, :lis, :len

  def initialize(array)
    @array = array
    @len = array.length
    @lis = Array.new(len, 1)
  end


  # time complexity - o(n^2)
  # space complexity - o(n)
  def process
    self.lis[0] = 1; i = 1
    while(i < len)
      j = 0
      while(j < i)
        if(array[j] < array[i])
          lis[i] = [lis[i],lis[j] + 1].max
        end
        j+= 1
      end
      i += 1
    end
    p lis.max
  end

  # def process1
  #   lis = []
  #   lis[0] = [array[0]]

  #   i = 1
  #   while(i < array.length)
  #     j = 0
  #     while(j < i)
  #       binding.pry
  #       lis[i] ||= []
  #       if(array[j] < array[i] and lis[i].length < lis[j].length + 1)
  #         lis[i] = lis[j].dup
  #       end

  #       j+= 1
  #     end

  #     lis[i].push(array[i])
      
  #     i += 1
  #   end
  #   p lis
  # end

  def self.run
    i = Prog.new([ 30,10,22,9,33,21,50,41,60 ])
    i.process
    # i.process1
  end

end

Prog.run