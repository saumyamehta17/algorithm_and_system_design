def flatten(head, tail)
  return if !head
  curr = head
  while(!curr.nil?)
    child_node = curr.child
    if child_node
      tail = append_child(tail, child_node)
    end  
    curr = curr.next
  end  
end  

def append_child(tail, child_node)
  tail.next = child_node
  child_node.prev = tail
  while(!child_node.next.nil?)
    child_node = child_node.next
  end
  child_node  
end 

def print_it(head)
  curr = head
  while(!curr.nil?)
    print "#{curr.data} -next-> "
    curr = curr.next
  end  
  puts 
end 

def unflatten(head)
  node = head
  exploreAndSeparate(node)
  curr = head
  while(!curr.next.nil?)
    curr = curr.next
  end
  tail = curr
  print_it(head)  
end  

def exploreAndSeparate(node)
  while(!node.nil?)
    child_node = node.child
    if child_node
      child_node.prev.next = nil
      child_node.prev = nil
      exploreAndSeparate(child_node)
    end
    node = node.next  
  end  
end  

Node = Struct.new(:data, :next, :child, :prev)
head =  Node.new(10)
head.next = Node.new(5)
head.next.prev = head

head.next.next = Node.new(12)
head.next.next.prev = head.next

head.next.next.next = Node.new(7)
head.next.next.next.prev = head.next.next

head.next.next.next.next = Node.new(11)
head.next.next.next.next.prev = head.next.next.next

head.child = Node.new(4)
head.child.next = Node.new(20)
head.child.next.prev = head.child

head.child.next.next = Node.new(13)
head.child.next.next.prev = head.child.next

head.next.next.next.next.child = Node.new(17)

head.next.next.next.next.child.next = Node.new(6)
head.next.next.next.next.child.next.prev = head.next.next.next.next.child

tail = head.next.next.next.next
puts "Flatten Multilist-----------"
flatten(head, tail)
print_it(head)
puts "Un Flatten Multilist-----------"
unflatten(head)