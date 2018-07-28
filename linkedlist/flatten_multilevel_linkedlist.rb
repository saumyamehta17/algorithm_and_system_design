def flatten_using_queue(head)
  q = Queue.new
  q.enq(head)

  while(!q.empty?)

    curr = q.deq

    while(!curr.nil?)
      print "#{curr.data} --> "
      q.enq(curr.child) if !curr.child.nil?
      curr = curr.next
    end  
  end  

end

def flatten(head)
  tail = head

  while(!tail.next.nil?)
    tail = tail.next
  end

  curr = head
  while(curr != tail)

    if(curr.child)
      tail.next = curr.child
      tmp = curr.child
      while(!tmp.next.nil?)
        tmp = tmp.next
      end
      tail = tmp  
    end  
    curr = curr.next
  end

  curr = head
  while(!curr.nil?)
    print "#{curr.data} --> "
    curr = curr.next
  end  
end  

Node = Struct.new(:data, :next, :child)
head =  Node.new(10)
head.next = Node.new(5)
head.next.next = Node.new(12)
head.next.next = Node.new(7)
head.next.next.next = Node.new(11)
head.child = Node.new(4)
head.child.next = Node.new(20)
head.child.next.next = Node.new(13)

head.next.next.next.child = Node.new(17)
head.next.next.next.child.next = Node.new(6)
puts "--------"
flatten_using_queue(head)
puts "--------"
flatten(head)
puts "--------"