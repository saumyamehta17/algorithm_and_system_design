require './base.rb'

ll = LinkedList.new
ll.insert_at_end(1)
ll.insert_at_end(2)
ll.insert_at_end(3)
ll.insert_at_end(4)
ll.insert_at_end(5)
puts "Print...."
ll.print_it
puts "----------------"

LinkedList.class_eval do
  def pair_swap
    current_node = head
    if(current_node.nil? && current_node.next.nil?)
      return
    end

    prev  = current_node
    current_node = current_node.next
    new_head = current_node
    while(1)
      next_node = current_node.next
      current_node.next = prev

      if(next_node.nil? || next_node.next.nil?)
        prev.next = next_node
        break
      end  
      prev.next = next_node.next

      prev = next_node
      current_node = prev.next
    end
    return new_head  
  end  

  def pair_swap_with_recursion(node)
    if(node.nil? || node.next.nil?)
      return node
    end

    curr_node = node
    remaing = curr_node.next.next
    new_head = curr_node.next  

    new_head.next = curr_node
    curr_node.next = pair_swap_with_recursion(remaing)
    return new_head
  end  
end 

# We are opening the class and adding more definitions to the class
# here if we redefine some methods then older methods will be overridden 
# 
# class LinkedList
#   def pair_swap
#     current_node = head
#     head = current_node.next
#     while(!current_node.nil? && !current_node.next.nil?)
#       next_node = current_node.next.next
#       prev_node = current_node.next
#       current_node.next_node = prev_node.next
#       prev_node.next_node = current_node
#       current_node = next_node
#     end
#   end    

#   def pair_swap_recursion()
#   end  
# end

# puts "swap nodes without recursion..."
# head = ll.pair_swap 
# ll.print_it(head)
# puts "\n"
puts "swap nodes with recursion..."
head = ll.pair_swap_with_recursion(ll.head)
ll.print_it(head)
puts "\n"