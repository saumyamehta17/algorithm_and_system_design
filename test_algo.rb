@arr = []
def is_bst?(head)
  inorder_traversal(head)
  n = _length(@arr)
  puts @arr.to_s
  for i in 1...n
    if @arr[i] < @arr[i-1]
      return false
    end  
  end
  true  
end

def _length(arr)
  i = 0
  while(!arr[i].nil?)
    i += 1
  end  
  i
end  
@min = -99
def inorder_traversal(node)
  return true if node.nil?
  unless inorder_traversal(node.left)
    return false
  end  
  # @arr << node.data
  if @min > node.data
    return false
  end
  @min = node.data
  inorder_traversal(node.right)
  true
end  

def isBstRecursion(node, min = -99, max = 99)
  return true if node.nil?

  if node.data < min || node.data > max
    return false
  end  

  isBstRecursion(node.left, min, node.data) &&
  isBstRecursion(node.right, node.data, max)
end  

Node = Struct.new(:data, :left, :right)
root = Node.new(7)
root.left = Node.new(2)
root.left.left = Node.new(5)
root.left.left.left = Node.new(1)
root.left.right = Node.new(3)
root.right = Node.new(10)

head = Node.new(4)
head.left = Node.new(6)
head.right = Node.new(5)
head.left.left = Node.new(1)
head.left.right = Node.new(3)
# puts is_bst?(root)
# puts inorder_traversal(root)
puts isBstRecursion(root)