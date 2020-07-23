def zigzag_level_order(root)
  stack = []
  stack.push([root, 0]) if root
  res = Array.new
  while(!stack.empty?)
    sub_stack = []
    while(!stack.empty?)
      node, level = stack.pop
      res[level] ||= []
      res[level] << node.val
      next_level = level + 1
      if next_level % 2 == 0
        sub_stack.push([node.right, next_level]) if node.right
        sub_stack.push([node.left, next_level]) if node.left
      else
        sub_stack.push([node.left, next_level]) if node.left
        sub_stack.push([node.right, next_level]) if node.right
      end
    end
    stack = sub_stack
  end
  res
end

class Node
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end
root = Node.new(3)
root.left = Node.new(9)
root.left.left = Node.new(90)
root.right = Node.new(20)
root.right.left = Node.new(15)
root.right.right = Node.new(7)
puts zigzag_level_order(root).to_s