Node = Struct.new(:data, :prev, :next, :level)

def p(node, dll = nil)
  return dll if node.nil?
  if dll.nil?
    dll = Node.new
  end  
  dll.data = node.data
  if node.left
    if dll.prev.nil?
      n = Node.new
      dll.prev = n
      n.next = dll
    end
    p(node.left, dll.prev)  
  end

  if node.right
    if dll.next.nil?
      n = Node.new
      dll.next = n
      n.prev = dll
    end
    p(node.right, dll.next)  
  end
  dll  
end  

N1 = Struct.new(:data, :left, :right)
root = N1.new(20)
root.left = N1.new(8)
root.left.left = N1.new(5)
root.left.right = N1.new(3)
root.right = N1.new(22)
list = p(root,nil)
while(1)
  break if list.nil? || list.prev.nil?
  list = list.prev
end

while(1)
  break if list.nil?
  puts list.data
  list = list.next
end  