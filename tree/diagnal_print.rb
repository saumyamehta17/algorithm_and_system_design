Node = Struct.new(:data, :right, :left)

class BinaryTree
  attr_accessor :root, :hsh

  def initialize(data)
    @root = Node.new(data)
    @hsh = {}
  end

  def self.sample
    bt = BinaryTree.new(8)
    root = bt.root
    root.left = Node.new(3)
    root.left.left = Node.new(1)
    root.left.right = Node.new(6)
    root.left.right.left = Node.new(4)
    root.left.right.right = Node.new(7)
    root.right = Node.new(10)
    root.right.right = Node.new(14)
    root.right.left = Node.new(13)
    bt
  end  

  def diagonal_print(node, h)
    return if node.nil?
    @hsh[h] = hsh[h].nil? ? [node.data] : hsh[h] << node.data
    diagonal_print(node.right, h)
    diagonal_print(node.left, h-1)
  end  
end

bt = BinaryTree.sample  
bt.diagonal_print(bt.root, 0)
puts bt.hsh