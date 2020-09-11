Node = Struct.new(:data, :left, :right)

def create_bst
  root = Node.new(5)

  root.left = Node.new(3)
  root.left.left = Node.new(2)
  root.left.right = Node.new(4)

  root.right = Node.new(6)
  root.right.right = Node.new(7)

  root
end