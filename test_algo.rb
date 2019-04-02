def to_dll(node, type = '')
  return if node.nil?
  return node if node.left.nil? && node.right.nil?

  if node.left
    prev_node = to_dll(node.left, 'prev')
    node.prev = prev_node
    prev_node.next = node if prev_node
  end
  
  if node.right
    next_node = to_dll(node.right, 'next')
    node.next = next_node
    next_node.prev = node if next_node
  end

  if type == 'prev'
    node.next || node
  elsif type == 'next'
    node.prev || node
  else
    node
  end  
end

def print_me(node)
  curr = node
  while(!curr.prev.nil?)
    curr = curr.prev
  end  

  while(!curr.nil?)
    puts curr.data
    curr = curr.next
  end  
end  
Node = Struct.new(:data, :left, :right, :next, :prev)

def lca_iterative(node, a, b)
  curr = node
  if curr.nil? || a.nil? || b.nil?
    return nil
  end  
  while(!curr.nil?)

    if a < curr.data && b < curr.data
      curr = curr.left
    elsif a > curr.data && b > curr.data
      curr = curr.right
    else
      return curr.data
    end  
  end  
end  
# root = Node.new(10)
# root.left = Node.new(12)
# root.left.left = Node.new(25)
# root.left.right = Node.new(30)

# root.right = Node.new(15)
# root.right.left = Node.new(36)
root = Node.new(20)
root.left = Node.new(8)
root.right = Node.new(22)
root.left.left = Node.new(4)
root.left.right = Node.new(12)
root.left.right.left = Node.new(10)
root.left.right.right = Node.new(14)
a = 12
b = 14
puts lca_iterative(root, a, b)
# node = to_dll(root)
# print_me(node)