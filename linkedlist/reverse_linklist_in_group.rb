# Reverse a Linked List in groups of given size 

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

  def print_it(head)
    current_node = head
    while(!current_node.nil?)
      puts current_node.value
      current_node = current_node.next
    end  
  end 

  def self.reverse_in_group(head, k) 
    i = 0; current_node = head; prev = nil; next_node = nil

    while(i < k && !current_node.nil?)
      next_node = current_node.next
      current_node.next = prev
      prev = current_node
      current_node = next_node
      i += 1
    end

    if(!current_node.nil?)
      head.next = reverse_in_group(current_node, k)
    end  

    return prev
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
ll.print_it(ll.head)
k = 5
head = LinkedList.reverse_in_group(ll.head, k)
puts "-----------------------"
ll.print_it(head)

