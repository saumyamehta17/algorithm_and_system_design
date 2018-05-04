Node = Struct.new(:key, :left, :right)

h1 = Node.new(10)
h1.left = Node.new(5)
h1.left.right = Node.new(8)
h1.right = Node.new(20)
h1.right.left = Node.new(12)
h1.right.left.right = Node.new(15)
h1.right.right = Node.new(40)

def p_in(node)
  return if node.nil?
  p_in(node.left)
  print "#{node.key} -> "
  p_in(node.right)
end

def serialise(node)
  arr = []
  serialise_helper(node, arr)
  return arr
end

def serialise_helper(node, arr)
  return if node == nil
  arr << node.key
  if node.left.nil? && node.right.nil?
    arr << -2
    return
  end
  if node.left.nil?
    arr << -1
  else
    serialise_helper(node.left, arr)
  end
  if node.right.nil?
    arr << -1
  else
    serialise_helper(node.right, arr)
  end
end

def deserialise(arr)
  store = {i: 0}
  return deser_helper(arr, store)
end

def deser_helper(arr, store)
  # if store[:i] >= arr.length
  #   return
  # end
  i = store[:i]
  if arr[i] == -1
    store[:i] += 1
    return nil
  end

  node = Node.new(arr[i])
  store[:i] += 1

  if arr[store[:i]] == -2
    store[:i] += 1
    return node
  end
  node.left = deser_helper(arr, store)
  node.right = deser_helper(arr, store)
  return node
end

print  "Tree: "
p_in h1
puts 

arr = serialise(h1)
puts "Serialized: #{arr}"

h2 = deserialise(arr)
print "Deserialized Tree:"
p_in h2
puts 
