def delNode(head, node)
  return if node.nil?
  if head == node
    head = head.next
  elsif node.next.nil?
    puts node.val
  else
    curr = head; prev = head
    found = false
    while(!curr.nil?)
      if curr == node
        found = true
        break
      end  
      prev = curr
      curr = curr.next
    end
    prev.next = node.next if found
  end
  head  
end  

# o(1) time and space
def delNodeV2(head, node)
  return if node.nil?
  if node.next.nil?
    node.val = nil    
  end
  next_node = node.next
  if next_node
    node.val = next_node.val
    node.next = next_node.next
  end
  head  
end  

def printt(head)
  curr = head
  while(!curr.nil?)
    print curr.val
    curr = curr.next
  end  
end  
Node = Struct.new(:val, :next)
head = Node.new('A')
head.next = Node.new('B')
head.next.next = Node.new('C')
node = head.next
printt(head)
puts
#delNode(head, node) // bruteforce
delNodeV2(head, node)
printt(head)