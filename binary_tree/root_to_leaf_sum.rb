Node = Struct.new(:data, :left, :right)

class BinaryTree
  attr_reader :root

  def initialize(data)
    @root = Node.new(data)
  end

  def self.sample
    bt = BinaryTree.new(10)
    root = bt.root
    root.left = Node.new(8)
    root.right = Node.new(2)
    root.left.left = Node.new(3)
    root.left.right = Node.new(5)
    root.right.left = Node.new(2)
    bt
  end  

  def root_to_leaf(node, req_sum, sum = 0)
    if node.nil?
      return false
    end

    if node.left.nil? && node.right.nil?
      sum += node.data
      if sum == req_sum
        return true
      end  
      # return false    
    end

    sum += node.data
    root_to_leaf(node.left, req_sum, sum) || 
    root_to_leaf(node.right, req_sum, sum)  
  end  
end


bt = BinaryTree.sample  
req_sum = 14
puts bt.root_to_leaf(bt.root, req_sum)