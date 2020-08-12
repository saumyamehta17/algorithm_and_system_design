require 'pry'
Node = Struct.new(:data, :left, :right)

class BinaryTree
  attr_accessor :root, :max_top

  def initialize(val)
    @root = Node.new(val)
    @max_top = -Float::INFINITY
  end

  def self.sample
    binary_tree = BinaryTree.new(10)
    root = binary_tree.root
    root.left = Node.new(2)
    root.left.left = Node.new(20)
    root.left.right = Node.new(1)
    root.right = Node.new(10)
    root.right.right = Node.new(-25)
    root.right.right.left = Node.new(3)
    root.right.right.right = Node.new(4)
    binary_tree
  end

  def max_sum(node)
    return 0 if node.nil?

    left = max_sum(node.left)
    right = max_sum(node.right)
    sum = left + right + node.data

    max_sum = [([left, right].max + node.data), node.data ].max
    self.max_top = [sum, max_sum, max_top].max
    max_sum
  end


end

tree = BinaryTree.sample
tree.max_sum(tree.root)
puts tree.max_top