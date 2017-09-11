class Node
  attr_accessor :value, :next_node

  def initialize(val)
    @value = val
    @next_node = nil
  end  
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end  

  def insert_at_end(val)
    if @head.nil?
      @head = Node.new(val)
    else
      current = @head
      while(current.next_node)
        current = current.next_node
      end  
      current.next_node = Node.new(val)
    end
    @head  
  end

  def print_linklist
    current = @head
    while(current)
      puts current.value
      current = current.next_node
    end  
  end 

  # if slow_ptr enters loop after covering non-looped distance say 'k'
  # then fast ptr will be at 2k
  # mean fast ptr will be in looped part 2k - k = k 
  # slow ptr k steps behind the fast ptr
  # fast ptr loop_size - k steps behind slow ptr
  # so if ptr is 2 nodes in where cycle of 5 nodes, it can be mod(k,loop_size)
  # mean 2 - 5(covered 0 loop), 7 - 5(covered 1 loop) 12 - 5(covered 2 loop)
  def detect_loop
    slow_ptr = @head
    fast_ptr = @head

    while(fast_ptr != slow_ptr)
      return nil if fast_ptr.nil? || fast_ptr.next_node.nil? || fast_ptr.next_node.next_node.nil?
      slow_ptr = slow_ptr.next_node
      fast_ptr = fast_ptr.next_node.next_node
    end  

    if(slow_ptr == fast_ptr)
      puts "Yeah Loop exits"
      return fast_ptr 
    else
     puts "No Loop"  
     return nil
    end 
  end 

  
  # SO, after reading detect_loop, we find that
  # we can move fast ptr k steps , and head ptr k steps
  # will meet at start of loop
  def remove_loop
    meeting_node = detect_loop
    return if meeting_node.nil?
    current = @head
    while(current != meeting_node)
      current = current.next_node
      meeting_node = meeting_node.next_node
    end  
    if current == meeting_node
      puts "Staring Node: #{current.value}"
    end  
  end  

  def create_cycle
    current = @head

    1.upto(3) do
      current = current.next_node
    end 

    loop_node = current

    while(current.next_node)
      current = current.next_node
    end 
    current.next_node = loop_node
  end  
end

l1 = LinkedList.new
l1.insert_at_end(10)
l1.insert_at_end(8)
l1.insert_at_end(7)
l1.insert_at_end(10)
l1.insert_at_end(11)
l1.print_linklist

puts 'Circular LinkedLIst.....'
l1.create_cycle
l1.remove_loop