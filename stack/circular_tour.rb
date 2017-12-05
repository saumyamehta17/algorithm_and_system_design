require 'pry'
class PetrolPump
  attr_accessor :petrol, :distance

  def initialize(p,d)
    @petrol = p
    @distance = d
  end  
end

class Tour
  attr_accessor :len, :start, :current_petrol, :first_point, :arr

  def initialize(arr)
    @arr = arr
    @len = arr.length
    @start = 0 
    @first_point = 0
    @current_petrol = 0
  end

  def print_first_circular_tour
    puts "len is #{len}"
    while(start < len-1)
      puts "total, #{current_petrol}"
      if(current_petrol < 0)
        puts "point is, #{first_point}"
        self.first_point = start
      end
      self.current_petrol += (arr[start].petrol - arr[start].distance)
      self.start += 1
    end

    # invalid
    if(current_petrol < 0)
      return -1
    end
    return first_point  
  end 
  
end  

# class Abc
#   attr_accessor :x,:y
#   def initialize()
#     @x = 10
#     @y = 20
#   end

#   def m1
#     x + y
#   end
# end
# arr = [PetrolPump.new(4,6), PetrolPump.new(6,5), PetrolPump.new(7,3), PetrolPump.new(4,5)]
# arr = [PetrolPump.new(6,4), PetrolPump.new(6,5), PetrolPump.new(7,3), PetrolPump.new(4,5)]
arr = [PetrolPump.new(6,4), PetrolPump.new(3,6), PetrolPump.new(7,3)]
t = Tour.new(arr)
puts t.print_first_circular_tour

