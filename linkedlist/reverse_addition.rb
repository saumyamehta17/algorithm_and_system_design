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

  def length
    current_node = self.head
    count = 0
    while(!current_node.nil?)
      count +=1
      current_node = current_node.next
    end  
    count
  end  

  def self.print_sum(l1, l2)
    if(l1.nil? && l2.nil?)    
      return {carry: 0}
    end

    hsh = self.print_sum(l1.next, l2.next)
    sum = l1.value + l2.value + hsh[:carry]
    value = sum % 10
    carry = sum / 10
    node = Node.new(value)
    if @summed_ll.nil?
       @summed_ll = node
    else
      node.next = @summed_ll
      @summed_ll = node
    end
    hsh[:carry] = carry; hsh[:head] = @summed_ll
    hsh
  end  

  def self.addition_from_end(l1 , l2)

    # making both linked list of equa size
    l1_length = l1.length
    l2_length = l2.length
    if(l1_length < l2_length)
      prepend_zeros(l1, l2_length - l1_length)
    elsif (l2_length < l1_length)
      prepend_zeros(l2, l1_length - l2_length)
    end  

    hsh = self.print_sum(l1.head,l2.head)      
    puts "carray remaining #{hsh[:carry]}"
    head = hsh[:head]
    if(hsh[:carry] > 0)
      node = Node.new(hsh[:carry])
      node.next = head
      head = node
    end
    head
  end  
  
end

# ll1 6->1->7
# ll2 2->9->5
# l1 = 9->1->2
ll = LinkedList.new
ll.insert_at_end(6)
ll.insert_at_end(1)
ll.insert_at_end(7)
puts "first linked list"
LinkedList.print_it(ll.head)

ll1 = LinkedList.new
ll1.insert_at_end(4)
ll1.insert_at_end(9)
ll1.insert_at_end(5)
puts "second linked list"
LinkedList.print_it(ll1.head)
puts "list length"
puts ll1.length
puts "third linked list after addition of first and second"
l3 = LinkedList.addition_from_end(ll, ll1)
LinkedList.print_it(l3)
