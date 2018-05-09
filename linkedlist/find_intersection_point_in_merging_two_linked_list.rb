def intersection(h1, h2)
  return if h1.nil? || h2.nil?
  c1 = getcount(h1)
  c2 = getcount(h2)

  diff = (c1-c2).abs
  if(c1 > c2)
    move(diff, h1, h2)
  else
    move(diff, h2, h1)
  end  
end 

def move(diff, h1, h2)
  curr1 = h1
  curr2 = h2
  diff.times do |x|
    curr1 = curr1.next
  end

  while(!curr1.nil? && !curr2.nil?)
    if(curr1.data == curr2.data)
      return curr1.data
    end

    curr1 = curr1.next
    curr2 = curr2.next

  end
  return "No Intersection found"  
end 

def getcount(h)
  c = 0
  curr = h
  while(!curr.nil?)
    curr = curr.next
    c += 1
  end
  c   
end  

Node = Struct.new(:data, :next)
h1 = Node.new(3)
h1.next = Node.new(6)
h1.next.next = Node.new(15)
h1.next.next.next = Node.new(15)
h1.next.next.next.next = Node.new(30)

h2 = Node.new(10)
h2.next = Node.new(15)
h2.next.next = Node.new(30)
puts intersection(h1,h2)