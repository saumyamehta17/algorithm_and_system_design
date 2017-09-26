# input - list 1->10->3->2->9>nil lets x = 9
# output - list 1->3->2->9->10  place values lessthan left side of x and greater than x in right
require 'pry'
class Node
  attr_accessor :next, :value

  def initialize(val)
    @value = val
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
      current_node = @head
      while(!current_node.next.nil?)
        current_node = current_node.next
      end  
      current_node.next = Node.new(val)
      @head
    end  
  end 

  def self.print_it(head = @head)
    current_node = head
    while(!current_node.nil?)
      print current_node.value
      print '->'
      current_node = current_node.next
    end
    print 'nil'
    puts "\n"  
  end 

  def splitted_linked_list(x)
    return nil if @head.nil?
    new_head = Node.new(x)
    current_node = @head
    while(!current_node.nil?)
      n = Node.new(current_node.value)
      puts "----#{new_head.value}"
      if (current_node.value < x)
        n.next = new_head 
        new_head = n
      elsif (current_node.value > x)
        new_head.next = n
      end
      current_node = current_node.next  
    end
    new_head  
  end  
end

ll = LinkedList.new
ll.insert_at_end(1)
ll.insert_at_end(10)
ll.insert_at_end(3)
ll.insert_at_end(2)
ll.insert_at_end(9)
LinkedList.print_it(ll.head)
new_head = ll.splitted_linked_list(9)
LinkedList.print_it(new_head)