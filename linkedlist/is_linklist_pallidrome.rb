require 'pry'
class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
  end  
end  

class LinkedList
  attr_accessor :head
  def initiailze
    @head = nil
  end  

  def insert_at_end(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current = @head
      while(current.next)
        current = current.next
      end  
      current.next = Node.new(value)
    end  
    @head
  end  

  def get_length

  end

  def is_pallindrome?(current_node , n)
    if(current_node.nil? || n == 0)
      return  {node: nil, is_pallindrome: false}
    elsif n == 1 #list length is odd
      return {node: current_node.next, is_pallindrome: true}
    elsif n == 2 #list length is even
       return {node: current_node.next.next, 
               is_pallindrome: (current_node.value == current_node.next.value)}
    end  
    res = is_pallindrome?(current_node.next, n - 2)
    
    if(res[:is_pallindrome] == false || res[:node].nil?)
      return {node: nil, is_pallindrome: false}
    elsif res[:node].value == current_node.value
      return {node: res[:node].next, is_pallindrome: true}
    else
      return {node: nil, is_pallindrome: false}
    end  
  end 
end  


ll = LinkedList.new
ll.insert_at_end(0) 
ll.insert_at_end(1) 
ll.insert_at_end(2) 
ll.insert_at_end(1) 
ll.insert_at_end(0)
 # let length is 5
 puts ll.is_pallindrome?(ll.head,5)
