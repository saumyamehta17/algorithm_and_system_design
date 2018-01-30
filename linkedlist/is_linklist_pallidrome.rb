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

# Part2



ll = LinkedList.new
ll.insert_at_end(0) 
ll.insert_at_end(1) 
ll.insert_at_end(2) 
ll.insert_at_end(1) 
ll.insert_at_end(0)
 # let length is 5
 puts ll.is_pallindrome?(ll.head,5)


 # part 2
 Node = Struct.new(:data, :next)

class LinkedList
  attr_accessor :head, :new_head

  def initialize(val)
    @head = Node.new(val)
  end

  def push(val)
    node = Node.new(val)
    node.next = head
    @head = node
  end  

  def print_it
    curr = head
    while(!curr.nil?)
      puts curr.data
      curr = curr.next
    end  
  end  

  def is_Pallindrome(p1 = head, p2 = head)
    @new_head = p1.next
    if(p2.next.nil? )
      return true
    end
    if p2.next.next.nil?
      val =  p1.data == new_head.data
      @new_head = new_head.next
      return val
    end  

    is_pallindrome_bool = is_Pallindrome(p1.next, p2.next.next)

    # puts "#{is_pallindrome_bool} --> #{p1.data}  -- #{new_head.data}"  
    if  is_pallindrome_bool && 
        p1.data == new_head.data
           @new_head = new_head.next
           return true
    else
      false
    end         
  end

  def is_pallindrome_iterative
    p1 = head; p2 = head

    # Mid Point
    while(!p2.next.nil? || !p2.next.next.nil?)
      p1 = p1.next
      p2 = p2.next.next
    end

    reversed_from = reverse_list_from(p1.next)
    p1.next = reversed_from

    matched = match(p1)
    puts matched
  end

  def reverse_list_from(h)
    prev = nil
    while(!h.next.nil?)
      p_next = h.next
      h.next = prev
      prev = h
      h = p_next
    end
    prev  
  end

  def match(p1)
    h1 = head
    h2 = p1.next

    while(!n2.nil?)
      if(n1.data != n2.data)
        return false
      end
      n1 = n1.next
      n2 = n2.next  
    end
    return true
  end  

end  

ll = LinkedList.new('R')
ll.push('A')
ll.push('D')
ll.push('A')
ll.push('R')
ll.print_it
# puts ll.is_Pallindrome
puts ll.is_pallindrome_iterative
