require 'pry'
class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end  
end  

class LinkedList

  attr_accessor :head

  def initialize
    @head = nil
  end  

  def insert_at_end(value)
    if head.nil?
      @head = Node.new(value)
    else
      current = @head
      while(current.next_node)
        current = current.next_node
      end  
      current.next_node = Node.new(value)
    end  
    head
  end 


  # Delete an node with a given value
  def delete_node(value)
    current = head
    prev = current
    while current
      if (current.value == value)
        prev.next_node = current.next_node
        break
      end  
      prev = current
      current = current.next_node
    end
    head
  end 

  def print
    current = head
    tmp_arr = []
    while(current)
      tmp_arr << current.value
      current = current.next_node
    end  
    p tmp_arr.join('->')
  end  
end  

l=LinkedList.new
l.insert_at_end(4)
l.insert_at_end(5)
l.insert_at_end(7)
l.insert_at_end(8)
l.insert_at_end(10)
l.print
l.delete_node(7)
l.print


