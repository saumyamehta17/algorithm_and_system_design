Node = Struct.new(:val, :left, :right)

def is_balanced(root)
  balanced_helper(root)[0]
end

def balanced_helper(node)
  return [true, 0] if node.nil?
  return [true, 1] if node.left.nil? && node.right.nil?

  left = balanced_helper(node.left)
  right = balanced_helper(node.right)
  l_h = left[1]
  r_h = right[1]
  h = [l_h, r_h].max + 1
  balanced = (l_h - r_h).abs <= 1 && left[0] && right[0]
  [balanced, h]
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.left.left = Node.new(5)

puts "Tree is Balanced = #{is_balanced(root)}"
