require 'pry'
class PetrolPump
  attr_accessor :petrol, :distance

  def initialize(p,d)
    @petrol = p
    @distance = d
  end  
end

class Tour
  attr_accessor :len, :arr

  def initialize(arr)
    @arr = arr
    @len = arr.length
  end

  # def print_first_circular_tour
  #   puts "len is #{len}"
  #   while(start < len-1)
  #     puts "total, #{current_petrol}"
  #     if(current_petrol < 0)
  #       puts "point is, #{first_point}"
  #       self.first_point = start
  #     end
  #     self.current_petrol += (arr[start].petrol - arr[start].distance)
  #     self.start += 1
  #   end

  #   # invalid
  #   if(current_petrol < 0)
  #     return -1
  #   end
  #   return first_point  
  # end

  def truck_tour
    start = 0; _end = 1; 
    current_petrol = arr[start].petrol - arr[start].distance

    while(start != _end)
      while(current_petrol < 0 && start != _end)
        current_petrol -= arr[start].petrol - arr[start].distance
        start = (start+1)%len
        return -1 if start == 0
      end  
      current_petrol += arr[_end].petrol - arr[_end].distance
      _end = (_end+1)%len
    end
    return -1 if (current_petrol < 0)  
    return start
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
res = t.truck_tour
puts res
# puts t.print_first_circular_tour

