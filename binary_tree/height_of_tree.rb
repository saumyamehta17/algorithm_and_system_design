Node = Struct.new(:data, :left, :right)

class BinaryTree
  attr_accessor :root

  def initialize(val)
    @root = Node.new(val)
  end

  def self.sample
    root = BinaryTree.new(12).root
    root.left = Node.new(15)
    root.left.left = Node.new(17)
    root.left.left.left = Node.new(20)
    root.right = Node.new(20)
    root
  end

  def self.max_depth(node, h = 0)
    return h if node.nil?

    return [max_depth(node.left, h+1), max_depth(node.right, h+1)].max
  end  
end  

root = BinaryTree.sample
puts BinaryTree.max_depth(root)