Node  = Struct.new(:data, :left, :right)
class BinaryTree
  attr_reader :root

  def initialize(data)
    @root  = Node.new(data)
  end

  def self.sample
    bt = BinaryTree.new(1)
    root = bt.root
    root.left = Node.new(2)
    root.right = Node.new(3)
    root.left.left = Node.new(4)
    root.left.right = Node.new(5)
    root.right.left = Node.new(6)
    root.right.right = Node.new(7)
    bt
  end
  
  def lca(node, n1, n2)
    return nil if node.nil?
    return node if node.data == n1 || node.data == n2

    left = lca(node.left, n1, n2)
    right = lca(node.right, n1, n2)

    return nil if left.nil? && right.nil?
    return node if !left.nil? && !right.nil?

    left.nil? ? right : left
  end  
    
end  

bt = BinaryTree.sample
n1 = 2
n2 = 4
node  = bt.lca(bt.root, n1, n2)
puts node.data
