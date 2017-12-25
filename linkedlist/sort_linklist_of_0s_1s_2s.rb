require 'pry'
# thru value
# this can be done by taking three variable to count number of 0, 1, 2
# and fill linkedlist with 0 for count of 0 given
# and fill linkedlist with 1 for count of 1 given
# and fill linkedlist with 2 for count of 2 given and Done..

# thru nodes
Node = Struct.new(:data, :next)

class LinkedList
  attr_accessor :head

  def initialize(val)
    @head = Node.new(val)
  end

  def insert(val)
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

  def print_it(curr_head = nil)
    current_node = curr_head || head
    while(!current_node.nil?)
      print "#{current_node.data}  "
      current_node = current_node.next
    end  
  end  

  def sort_now
    current_node = head

    # three dummy nodes
    dummy_zero_node = Node.new(0)
    dummy_one_node  = Node.new(0)
    dummy_two_node  = Node.new(0)
    zero_node = dummy_zero_node
    one_node = dummy_one_node
    two_node = dummy_two_node

    while(!current_node.nil?)
      if    current_node.data == 0
        zero_node.next = current_node
        zero_node = zero_node.next
      elsif current_node.data == 1
        one_node.next = current_node
        one_node = one_node.next
      else
        two_node.next = current_node
        two_node = two_node.next
      end
      current_node = current_node.next  
    end

    # Merge all three pointers
    zero_node.next = dummy_one_node.next ? dummy_one_node.next : dummy_two_node.next
    one_node.next = dummy_two_node.next
    dummy_two_node.next = nil
    # skipping first dummy node 0 and returing zero_node.next
    dummy_zero_node.next
  end  
end

ll = LinkedList.new(1)
ll.insert(1)
# ll.insert(2)
ll.insert(0)   
ll.insert(1)
ll.insert(2)
puts "Before sorting"
ll.print_it

puts "\nAfter sorting"

head = ll.sort_now
ll.print_it(head)
puts "\n"

