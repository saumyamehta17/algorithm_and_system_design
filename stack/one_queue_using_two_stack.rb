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