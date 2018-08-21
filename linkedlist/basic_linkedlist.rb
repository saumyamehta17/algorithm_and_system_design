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

  def reverse
    return if head.nil?
    curr_node = head
    while(!curr_node.nil?)
      next_node = curr_node.next
      curr_node.next = @prev_node
      @prev_node = curr_node
      curr_node = next_node
    end
    @head = @prev_node
  end

  def recursive_reverse(curr, prev)
    if(curr.next.nil?)
      self.head = curr
      curr.next = prev
      return nil
    end

    next1 = curr.next
    curr.next = prev
    recursive_reverse(next1, curr)
    return head  
  end    

  def find_middle_elem
    # take 2 pointers
    p1 = p2 = head
    while(!p2.nil? && !p2.next.nil?)
      p1 = p1.next
      p2 = p2.next.next
    end
    print p1.val  
  end 

  def print_it
    curr_node = head
    while(!curr_node.nil?)
      print "-->#{curr_node.val}"
      curr_node = curr_node.next
    end  
  end 
end  

ll = LinkedList.new
ll.insert_at_end(1)
ll.insert_at_end(2)
ll.insert_at_end(3)
ll.insert_at_end(4)
ll.insert_at_end(5)
ll.insert_at_end(6)
ll.print_it
puts "\nreverse is...."
ll.recursive_reverse(ll.head, nil)
# ll.reverse
ll.print_it
# puts "\nMiD element is...."
# ll.find_middle_elem