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
  def del_node_by_value(value)
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

  def del_node_by_position(pos)
    current = head
    size_of_linkedlist = length
    return 'Not applicable' if size_of_linkedlist < pos or pos < 1
    1.upto(pos-1) do |x|
      current = current.next_node
    end  
    p current.value
  end
  
  def search_element(value)
    current = head
    while(current)
      return true if(current.value == value)
      current = current.next_node
    end  
    false
  end

  # recursive calling for searching an element
  def search_element_with_recursion(value, current = head)
    return false if current.nil?
    return true if current.value == value
    search_element_with_recursion(value, current.next_node)
  end  

  def find_middle_element
    current = head
    size_of_linkedlist = length
    if size_of_linkedlist <= 1
      return
    end  
    size = size_of_linkedlist/2
    1.upto(size) do |x|
      current = current.next_node
    end  

    p current.value
  end  

  # swap two nodes
  # case1: any value not present in the list
  # case2: one value is at head
  # case3: one value is at tail
  # case4: Both values are same
  def swap_nodes(value1, value2)

    if(value1 == value2)
      return head
    end  
    current = head
    curr1 = current
    curr2 = current
    prev1 = nil
    prev2 = nil

    while(current)
      if curr1.value != value1
        prev1 = curr1
        curr1 = curr1.next_node
      end  

      if curr2.value != value2
        prev2 = curr2
        curr2 = curr2.next_node
      end  
      current = current.next_node  
    end

    if (curr1.nil? or curr2.nil?)
      return
    end  

    if !prev1.nil?
      prev1.next_node = curr2
    else
      self.head = curr2  
    end  

    if !prev2.nil?
      prev2.next_node = curr1
    else
     self.head = curr1  
   end  
   tmp = curr1.next_node
   curr1.next_node = curr2.next_node
   curr2.next_node = tmp
   head
 end  

  # length of a linked list
  def length
    current = head
    count = 0
    while current
      count += 1
      current = current.next_node
    end
    count
  end

  def length_with_recursion(current = head)
    return 0 if current.nil?
    return 1 + length_with_recursion(current.next_node)
  end  

  def remove_duplicates_unsorted_with_buffer
    current = head
    hsh = []
    prev = current
    while(!current.nil?)
      if hsh.include? current.value
        prev.next_node = current.next_node
      else
        hsh << current.value
      end
      prev = current
      current = current.next_node
    end  
    head
  end 

  def remove_duplicates_unsorted_without_buffer 

  end  

  def print_kth_from_last(k)
    current = head
    l = length
    return if l < k
    return current.value if l == k
    l_from_last = l - k
    1.upto(l_from_last) {|x| current = current.next_node}
    current.value
  end  

  def print_kth_from_last_with_runner_technique(k)
    fast_ptr = head
    slow_ptr = head
    index = 1
    while(index < k && fast_ptr.next_node)
      fast_ptr = fast_ptr.next_node
      index += 1
    end
    return nil if index < k

    while(fast_ptr.next_node)
      fast_ptr = fast_ptr.next_node
      slow_ptr = slow_ptr.next_node
    end
    slow_ptr.value
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

  # GIven two list represented by numbers where each node having one digit of a number
  # Sum two number and input into new list
  def sum_two_list_numbers(l1, l2, carry = 0)
    carry = carry % 10
    if !l1.nil? || !l2.nil?
      return value = (l1.nil? ? l1.value : 0) + (l2.nil? ? l2.value : 0) + carry
      v = sum_two_list_numbers((l1.next.nil? ? nil : l1.next), (l2.next.nil? ? nil : l2.next), (value >= 1 ? 1 : 0))
      
    end  
  end  
end  

# l=LinkedList.new
# l.insert_at_end(4)
# l.insert_at_end(5)
# l.insert_at_end(7)
# l.insert_at_end(8)
# l.insert_at_end(90)
# l.insert_at_end(10)
# l.insert_at_end(12)
# l.insert_at_end(14)
# l.print
# l.del_node_by_value(7)
# l.print
# p l.length
# l.del_node_by_position(2)
# l.swap_nodes(4,14)
# l.print
# l.find_middle_element
# p l.length_with_recursion
# p l.search_element(14) #--> will return true
# p l.search_element(17) #--> will return false
# p l.search_element_with_recursion(17)
# p l.search_element_with_recursion(12)

l1 = LinkedList.new
l1.insert_at_end(10)
l1.insert_at_end(8)
l1.insert_at_end(7)
l1.insert_at_end(10)
l1.insert_at_end(11)
l1.print
l1.remove_duplicates_unsorted_with_buffer
l1.print
p l1.print_kth_from_last(5)
p l1.print_kth_from_last_with_runner_technique(3)



