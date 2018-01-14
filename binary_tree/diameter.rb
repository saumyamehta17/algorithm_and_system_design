# Get width od tree

Node = Struct.new(:data, :left, :right)

class BinaryTree
  attr_accessor :root, :max_top

  def initialize(val)
    @root = Node.new(val)
    @max_top = -461168607387903
  end

  def self.sample
    binarytree = BinaryTree.new(1)
    r = binarytree.root
    r.left = Node.new(2)
    r.left.left = Node.new(4)
    r.left.right = Node.new(5)
    r.left.right.left = Node.new(7)

    r.right = Node.new(3)
    binarytree
  end  

  def get_diameter(node)
    return 0 if node.nil?

    ldiameter = get_diameter(node.left)
    rdiameter = get_diameter(node.right)
    sum = ldiameter + rdiameter + 1
    self.max_top = [sum, max_top].max
    return [ldiameter, rdiameter].max + 1
  end  
end

b = BinaryTree.sample  
b.get_diameter(b.root)
puts b.max_top