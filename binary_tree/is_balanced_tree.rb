class Node
  attr_accessor :value, :left, :right

  def initialize(val)
    @value = val
  end  
end  

class BinaryTree
  attr_accessor :root
  def initialize(val)
    @root = Node.new(val)
  end  

  def self.balanced_sample
    _tree = Node.new(1)
    _tree.left = Node.new(2)
    _tree.right = Node.new(3)
    _tree.left.left = Node.new(4)
    _tree.left.right = Node.new(5)
    _tree
  end

  def self.unbalanced_sample
    _tree = Node.new(1)
    _tree.left = Node.new(2)
    _tree.right = Node.new(3)
    _tree.left.left = Node.new(4)
    _tree.left.left.left = Node.new(8)
    _tree.left.right = Node.new(5)
    _tree
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

# root = BinaryTree.balanced_sample
root = BinaryTree.unbalanced_sample
puts BinaryTree.is_balanced?(root)