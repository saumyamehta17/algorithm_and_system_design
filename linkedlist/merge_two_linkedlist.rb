require 'pry'
Node = Struct.new(:value, :next)

class LinkedList
  attr_accessor :head

  def initialize(val)
    @head = Node.new(val)
  end

  def insert_at_end(val)
    if head.nil?
      self.head = Node.new(val)
    else
      current_node = head
      while(!current_node.next.nil?)
        current_node = current_node.next
      end
      current_node.next = Node.new(val)  
    end  
    head
  end  

  def print
    current_node = head
    while(!current_node.nil?)
      puts current_node.value
      current_node = current_node.next
    end  
  end 

  def self.merge_sort(l1, l2)
    res = nil
    if(l1.nil?)
      return l2
    end
    if(l2.nil?)
      return l1
    end

    if(l1.value < l2.value)
      res = l1
      res.next = merge_sort(l1.next, l2)
    else
      res = l2
      res.next = merge_sort(l1, l2.next)
    end

    return res    
  end

  def self.merge_iterative(h1,h2)
    result = Node.new(0)
    new_head = result
    while(!h1.nil? && !h2.nil?)
      if(h1.value < h2.value)
        result.next = Node.new(h1.value)
        h1 = h1.next
      else
        result.next = Node.new(h2.value)
        h2 = h2.next
      end 
      result = result.next 
    end
    if(h1.nil? && h2.nil?)
      # 
    elsif h1.nil?
      result.next = h2
    else
      result.next = h1
    end  
    new_head.next
  end 
end  
# n =  Node.new(12)
# puts n
# n.next = Node.new(14)
# puts n

puts "-----------List 1-----------"
l1 = LinkedList.new(10)
l1.insert_at_end(20)
l1.insert_at_end(22)
l1.insert_at_end(30)
l1.print
puts "-----------List 2-----------"
l2 = LinkedList.new(5)
l2.insert_at_end(21)
l2.insert_at_end(34)
l2.print

# res = LinkedList.merge_sort(l1.head, l2.head)
# puts "-----------Merge Result Recursive-----------"
# while(!res.nil?)
#   puts res.value
#   res = res.next
# end  
res = LinkedList.merge_iterative(l1.head, l2.head)
puts "-----------Merge Result Iterative-----------"
while(!res.nil?)
  puts res.value
  res = res.next
end  