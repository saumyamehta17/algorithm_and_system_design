require 'pry'
class Node
  attr_accessor :next, :val

  def initialize(val)
    @val = val
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def insert_at_end(val)
    if(head.nil?)
      self.head = Node.new(val)
    else
      curr_node = head
      while(!curr_node.next.nil?)
        curr_node = curr_node.next
      end
      curr_node.next = Node.new(val)
    end
    head 
  end

  def print_it(curr_node = nil)
    curr_node ||= head
    while(!curr_node.nil?)
      print "-->#{curr_node.val}"
      curr_node = curr_node.next
    end  
  end
end  

