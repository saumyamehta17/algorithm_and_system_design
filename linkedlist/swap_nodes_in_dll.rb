DLL = Struct.new(:data, :prev, :next)  

class SwapNodes
  attr_accessor :dll, :head, :tail

  def initialize(head, tail)
    @head = head
    @tail = tail
  end

  def swap_nodes(n1, n2)
    puts "swapping #{n1.data} and #{n2.data}"
    if n1 == n2 || n1.nil? || n2.nil?
      puts "Same output/Invalid"
      print_it
      return head
    elsif n1.prev == n2 || n2.next == n1 || n2.prev.nil? || n1.next.nil?
      #exchange n1 and n2
      tmp = n1
      n1 = n2
      n2 = tmp
    end
    puts "After exchanging swapping #{n1.data} and #{n2.data}" 
    # adjacents
    if n1.next == n2 || n2.prev == n1
      swap_adjacent_nodes(n1, n2)
    # n1 is head and n2 is tail  
    elsif n1.prev.nil? && n2.next.nil?
      swap_head_tail(n1, n2)
    # n1 is head  
    elsif n1.prev.nil?
      swap_head_n2(n1, n2)
    # n2 is tail  
    elsif n2.next.nil?
      swap_n1_tail(n1, n2)
    # normal case  
    else
      swap_n1_n2(n1, n2)
    end  
          
  end  

  def swap_adjacent_nodes(n1, n2)
    prev1 = n1.prev
    next2 = n2.next

    n1.next = next2
    n2.prev = prev1
    n1.prev = n2
    n2.next = n1

    if !prev1.nil?
      prev1.next = n2
    else
      @head = n2    
    end  
    if !next2.nil?
      next2.prev = n1
    else
      @tail = n1
    end  
    print_it
  end

  def swap_head_tail(n1, n2)
    next1 = n1.next
    prev2 = n2.prev

    n1.prev = prev2
    n1.next = nil
    n2.prev = nil
    n2.next = next1

    next1.prev = n2
    prev2.next = n1

    @head = n2
    @tail = n1
    print_it
  end

  def swap_head_n2(n1, n2)
    next1 = n1.next
    prev2 = n2.prev
    next2 = n2.next

    n1.next = next2
    n1.prev = prev2
    n2.next = next1
    n2.prev = nil

    next1.prev = n2
    next2.prev = n1
    prev2.next = n1
    @head = n2
    print_it
  end

  def swap_n1_tail(n1, n2)
    prev2 = n2.prev
    prev1 = n1.prev
    next1 = n1.next

    n1.next = nil
    n1.prev = prev2
    n2.next = next1
    n2.prev = prev1

    prev2.next = n1
    prev1.next = n2
    next1.prev = n2
    @tail = n1
    print_it
  end 

  def swap_n1_n2(n1, n2)
    prev2 = n2.prev
    next2 = n2.next
    prev1 = n1.prev
    next1 = n1.next

    n1.next = next2
    n1.prev = prev2
    n2.next = next1
    n2.prev = prev1

    next2.prev = n1
    prev2.next = n1
    next1.prev = n2
    prev1.next = n2
    print_it
  end 

  def print_it
    current = head
    while(!current.nil?)
      print "#{current.data} -->"
      current = current.next
    end  
  end

  def print_from_tail
    current = tail
    while !current.nil?
      print "#{current.data} -->"
      current = current.prev
    end
  end  

end  


#Normal Case
head = DLL.new(10)
head.next = DLL.new(9)
head.next.prev = head
head.next.next = DLL.new(27)
head.next.next.prev = head.next
head.next.next.next = DLL.new(8)
head.next.next.next.prev = head.next.next
head.next.next.next.next = DLL.new(11)
head.next.next.next.next.prev = head.next.next.next
head.next.next.next.next.next = DLL.new(12)
head.next.next.next.next.next.prev = head.next.next.next.next
tail = head.next.next.next.next.next
sn = SwapNodes.new(head, tail)
puts "--------------"
sn.print_it
puts "--------------"
sn.print_from_tail
puts "--------------"
n1 = head.next.next
n2 = head.next.next.next.next
sn.swap_nodes(n1, n2)
puts "--------------"
n1 = head.next
n2 = head.next.next.next.next
sn.swap_nodes(n1, n2)

puts "--------------"
n1 = head
n2 = tail
sn.swap_nodes(n1, n2)


puts "--------------"
n1 = sn.head
n2 = sn.head.next
sn.swap_nodes(n1, n2)

puts "--------------"
n1 = sn.head.next.next
n2 = sn.head.next.next
sn.swap_nodes(n1, n2)

puts "--------------"
n1 = sn.head.next.next.next.next
n2 = sn.head
sn.swap_nodes(n1, n2)

puts "--------------"

n1 = sn.head.next.next
n2 = sn.tail
sn.swap_nodes(n1, n2)

