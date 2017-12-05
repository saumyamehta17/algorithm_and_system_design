class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = - MAX - 1
end
# Design a stack that supports getMin() in O(1) time
@stack1 = []
@stack2 = []

def push(val)
  if val <= get_min
    @stack2.push(val)
  end
  @stack1.push(val)  
end

def pop
  val = @stack1.pop
  if(val == get_min)
    @stack2.pop
  end  
end  

def get_min
  if @stack2.empty?
    Integer::MAX
  else
    @stack2.last
  end  
end  

# Design a stack that supports getMin() in O(1) time and O(1) extra space
@stack3 = []
def sol2_push(val)
  if(@stack3.empty?)
    @min_elem = val
    @stack3.push(val)
  elsif val >= @min_elem
    @stack3.push(val)
  elsif val < @min_elem
    x = 2*val - @min_elem
    @stack3.push(x)
    @min_elem = val
  end  
end  

def sol2_pop
  return if @stack3.empty?
  y = @stack3.pop
  if(y >= @min_elem)
    puts "popped is #{y}"
  else
    puts "popped is #{@min_elem}"
    @min_elem = 2*@min_elem - y
  end  
end

def sol2_get_min
  puts "Min element is --> #{@min_elem}"
end  


sol2_push(5)
sol2_push(6)
sol2_push(4)
sol2_push(9)
print @stack3
puts "\n"
sol2_get_min
sol2_pop
sol2_pop
sol2_get_min