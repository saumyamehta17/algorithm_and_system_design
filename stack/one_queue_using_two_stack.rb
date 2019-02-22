require 'pry'
@stack1 = []
@stack2 = []

def enqueue(data)
  @stack1.push(data)
end

def dequeue
  copy_elements if @stack2.empty?
  @stack2.pop
end

def copy_elements
  while(!@stack1.empty?)
    @stack2.push(@stack1.pop)
  end  
end

enqueue(12)
enqueue(14)
enqueue(15)
puts dequeue

# Using: one stack and one functional call
@s1 = []
def _enq(val)
  @s1.push(val)
end 

def _deq
  if @s1.empty?
    puts -1
    return
  elsif @s1.length == 1
    puts @s1.pop
    return
  else
    x = @s1.pop
    _deq
    @s1.push(x)
  end  
end
