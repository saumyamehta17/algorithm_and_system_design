def find_paths(root, a, path)
  return false if root.nil?
  path << root.data
  if root.data == a
    return true
  end

  if (root.left && find_paths(root.left, a, path)) ||
     (root.right && find_paths(root.right, a, path))  
     return true
  end
  
  path.pop
  false   
end

def lca_using_paths(root, a, b)
  path1 = []
  path2 = []
  find_paths(root, a, path1)
  find_paths(root, b, path2)

  puts path1.to_s
  puts path2.to_s

  # Compare paths
  i = 0
  while(i < path1.length && i < path2.length)
    return path1[i-1] if path1[i] != path2[i]
    i += 1
  end  
end

Node = Struct.new(:data, :left, :right)
root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
a = 5
b = 4
puts lca_using_paths(root, a, b)