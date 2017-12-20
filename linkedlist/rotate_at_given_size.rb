#  Rotate a Linked List
require 'pry'
class Node
  attr_accessor :next, :value

  def initialize(value)
    @value = value
  end
end  

class LinkedList
  attr_accessor :head

  def initialize(val)
    @head = Node.new(val)
  end

  def insert_at_end(val)
    if head.nil?
      @head = Node.new(val)
    else
      current_node = head
      while(!current_node.next.nil?)
        current_node = current_node.next
      end
      current_node.next = Node.new(val)  
    end
    head  
  end

  def print_it
    current_node = head
    while(!current_node.nil?)
      puts current_node.value
      current_node = current_node.next
    end  
  end 

  def rotate(k)
    i = 1
    current_node = head
    while(i < k && !current_node.nil?)
      current_node = current_node.next
      i += 1
    end
    next_node = current_node.next  
    current_node.next = nil
    current_node = next_node
    while(!current_node.next.nil?)
      current_node = current_node.next
    end
    current_node.next = @head
    @head = next_node
    @head  
  end  
end  

ll = LinkedList.new(1)
ll.insert_at_end(2)
ll.insert_at_end(3)
ll.insert_at_end(4)
ll.insert_at_end(5)
ll.insert_at_end(6)
ll.insert_at_end(7)
ll.insert_at_end(8)
ll.print_it
k = 5
ll.rotate(k)
puts "-----------------------"
ll.print_it

