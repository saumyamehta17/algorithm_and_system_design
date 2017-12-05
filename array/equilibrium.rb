class Equilibrium
  attr_accessor :left_sum, :right_sum, :len, :arr

  def initialize(arr)
    @arr = arr
    @len = arr.length
    @right_sum = 0
    @left_sum = 0
  end

  def total_sum
    0.upto(len-1).each do |i|
      @left_sum += arr[i]
    end
  end

  def find_equilibrium
    (len-1).downto(0).each do |i|
      self.left_sum -= arr[i]
      if(left_sum == right_sum)
        print "Equilibrium point is #{i}"
        return
      else
        @right_sum += arr[i]
      end  
    end
    print "Nothing Found.."  
  end  
end

# arr = [-7, 1, 5, 2, -4, 3, 0]
arr = [-7, 1, 5, 2, -4, 3]
e = Equilibrium.new(arr)
e.total_sum
e.find_equilibrium
