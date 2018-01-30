require 'pry'
# thru value
# this can be done by taking three variable to count number of 0, 1, 2
# and fill linkedlist with 0 for count of 0 given
# and fill linkedlist with 1 for count of 1 given
# and fill linkedlist with 2 for count of 2 given and Done..

# thru nodes
Node = Struct.new(:data, :next)
require 'pry'
class LinkedList
  attr_accessor :head

  def initialize(data = nil)
    @head = Node.new(data)
  end

  def insert_data(val)
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

  def dutch_flag_sol
    dummy_node0 = Node.new(0)
    dummy_node1 = Node.new(0)
    dummy_node2 = Node.new(0)
    end0 = dummy_node0
    end1 = dummy_node1
    end2 = dummy_node2

    curr = head
    while(!curr.nil?)
      data = curr.data
      if(data == 0)
        end0.next = curr; end0 = end0.next
      elsif data == 1
        end1.next = curr; end1 = end1.next
      else
        end2.next = curr; end2 = end2.next
      end
      curr = curr.next  
    end

    end0.next = dummy_node1.next.nil? ? dummy_node2.next : dummy_node1.next
    end1.next = dummy_node2.next
    end2.next = nil

    dummy_node0.next  
  end

  def print_it(curr = head)
    while(!curr.nil?)
      print "#{curr.data}  "
      curr = curr.next
    end  
  end  
end

ll = LinkedList.new(1)  
ll.insert_data(0)
ll.insert_data(2)
ll.insert_data(1)
ll.insert_data(0)
ll.insert_data(1)
ll.insert_data(0)
ll.print_it
puts "---------------------------"
h = ll.dutch_flag_sol
ll.print_it(h)

