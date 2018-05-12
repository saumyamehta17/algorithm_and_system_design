def delete(head, k)
  i = 1
  curr = head

  puts head
  while(!curr.nil? && !curr.next.nil?)

    if i == k-1
      curr.next = curr.next.next
      i = 0
    end  

    i += 1
    curr = curr.next
  end

  puts head  
end

Node = Struct.new(:data, :next)  
head = Node.new(1)
head.next = Node.new(2)
head.next.next = Node.new(3)
head.next.next.next = Node.new(4)
head.next.next.next.next = Node.new(5)
head.next.next.next.next.next = Node.new(6)
head.next.next.next.next.next.next = Node.new(7)
head.next.next.next.next.next.next.next = Node.new(8)
k = 3
delete(head, k)