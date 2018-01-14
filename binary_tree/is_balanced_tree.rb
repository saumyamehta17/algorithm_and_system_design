class Node
  attr_accessor :value, :left, :right

  def initialize(val)
    @value = val
  end  
end  

class BinaryTree
  attr_accessor :root, :is_bal
  def initialize(val)
    @root = Node.new(val)
    @is_bal = true
  end  

  def self.balanced_sample
    bt = BinaryTree.new(1)
    _tree = bt.root 
    _tree.left = Node.new(2)
    _tree.right = Node.new(3)
    _tree.left.left = Node.new(4)
    _tree.left.right = Node.new(5)
    bt
  end

  def self.unbalanced_sample
    bt = BinaryTree.new(1)
    _tree = bt.root
    _tree.left = Node.new(2)
    _tree.right = Node.new(3)
    _tree.left.left = Node.new(4)
    _tree.left.left.left = Node.new(8)
    _tree.left.right = Node.new(5)
    bt
  end  

  def self.unbalanced_sample2
    bt = BinaryTree.new(1)
    _tree = bt.root
    _tree.right = Node.new(3)
    _tree.right.right = Node.new(4)
    _tree.right.right = Node.new(5)
    bt
  end  

  def is_balanced_with_recursion(node)
    if node.nil?
      return 0
    end

    left = is_balanced_with_recursion(node.left)
    right = is_balanced_with_recursion(node.right)  
    if left & right
      h = (left - right).abs
      if h > 1
        self.is_bal = false
        return false
      end  
      return [left, right].max + 1
    else
      return false
    end  
  end  

  def self.is_balanced?(node)

    nodes = []
    depths = []

    nodes.push([node, 0]) #node and height

    while(!nodes.empty?)
      if(node.nil?)
        return true
      end  
      node, depth = nodes.pop

      if(node.left.nil? && node.right.nil?)
        depths.push(depth) unless depths.include?(depth)
        
        # if depths length is 1 its still handle as nil.to_i
        if(depths.length > 2 || (depths[0].to_i - depths[1].to_i).abs > 1)
          return false
        end  
      else
        if(node.left)
          nodes.push([node.left, depth+1])
        end  
        if(node.right)
          nodes.push([node.right, depth+1])
        end  
      end  

    end

    return true
  end  
end  

# tree = BinaryTree.balanced_sample
tree = BinaryTree.unbalanced_sample2

# tree.is_balanced_with_recursion(tree.root)
# puts tree.is_bal
# tree = BinaryTree.unbalanced_sample
# tree = BinaryTree.balanced_sample
puts BinaryTree.is_balanced?(tree.root)