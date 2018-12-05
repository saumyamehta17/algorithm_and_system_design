Node = Struct.new(:data, :left, :right)
class BinaryTree
  attr_reader :root

  def initialize(val)
    @root = Node.new(val)
  end

  def self.sample
    bt = BinaryTree.new(1)
    root = bt.root
    root.left = Node.new(2)
    root.right = Node.new(3)
    root.left.left = Node.new(4)
    root.left.right = Node.new(5)
    bt
  end

  def count_leaf_node(node)  
    if node.nil?
      return 0
    end

    if(node.left.nil? && node.right.nil?)  
      return 1
    end  

    return count_leaf_node(node.left) + count_leaf_node(node.right)  
  end  

end  

bt = BinaryTree.sample
puts bt.count_leaf_node(bt.root)