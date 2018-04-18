Node = Struct.new(:data, :next)
def ms(h1, h2)
  if h1.nil?
    return h1
  end
  
  if h2.nil?
    return h2
  end

  if h1.data < h2.data
    h1.next = ms(h1.next, h2)
    h1
  else
    h2.next = ms(h1, h2.next)
    h2
  end
end 

h1 = Node.new(5)
h1.next = Node.new(7)
h1.next.next = Node.new(9)

h2 = Node.new(4)
h2.next = Node.new(6)
h2.next.next = Node.new(8)
res = ms(h1, h2) 
while(!res.nil?)
  puts res.data
  res = res.next
end  