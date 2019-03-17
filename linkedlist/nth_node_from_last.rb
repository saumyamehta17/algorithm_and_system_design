def find_mth_from_last(head, k)
  if !head
    return nil
  end
  curr = head
  for i in 0...k-1  
    if !curr.next
      return nil
    else
      curr = curr.next
    end  
  end
  puts curr
  mbehind = head
  while(!curr.next.nil?)  
    mbehind = mbehind.next
    curr = curr.next
  end
  puts mbehind.data  
end  

Node = Struct.new(:data, :next)
head = Node.new(2)
head.next = Node.new(9)
head.next.next = Node.new(10)
head.next.next.next = Node.new(11)
head.next.next.next.next = Node.new(1)
head.next.next.next.next.next = Node.new(99)

find_mth_from_last(head, 2)