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

  def self.addition(l1 , l2)
    carry = 0
    while(!l1.nil? || !l2.nil?)
      a = l1 && l1.value || 0
      b = l2 && l2.value || 0
      sum = (a.to_i + b.to_i + carry)
      if @l3.nil?
        @head = @l3 = Node.new(sum%10)
      else
        @l3.next = Node.new(sum%10)
        @l3 = @l3.next
      end  

      carry = sum > 10 ? 1 : 0

      l1 = l1 && l1.next || nil
      l2 = l2 && l2.next || nil
    end 
    @head
  end  
  
end

# ll1 7->1->6
# ll2 5->9->2
ll = LinkedList.new
ll.insert_at_end(7)
ll.insert_at_end(1)
ll.insert_at_end(6)
puts "first linked list"
LinkedList.print_it(ll.head)

ll1 = LinkedList.new
ll1.insert_at_end(5)
ll1.insert_at_end(9)
ll1.insert_at_end(2)
puts "second linked list"
LinkedList.print_it(ll1.head)

puts "third linked list after addition of first and second"
l3 = LinkedList.addition(ll.head, ll1.head)
LinkedList.print_it(l3)

