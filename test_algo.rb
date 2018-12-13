Node = Struct.new(:data, :left, :right)
class Tree
  attr_accessor :root, :balanced

  def initialize
    @balanced = true
  end  

  def isBalanced(node)
    if !balanced
      return 0
    end  

    if node.nil?
      return 0
    end

    left_h = isBalanced(node.left)
    right_h = isBalanced(node.right)

    if (left_h - right_h).abs > 1
      @balanced = false
      return 0
    end

    [left_h, right_h].max + 1  
  end

  def isBalancedIterative(node)
    nodes = []
    depths = []
    nodes.push([node, 0])
    while(!nodes.empty?)
      node, depth = nodes.pop
      if node.left.nil? && node.right.nil?
        depths << depth if !depths.include?(depth)
        if depths.length > 2 || (depths[1].to_i - depths[0].to_i).abs > 1
          return false
        end
      else
        nodes.push([node.left, depth+1]) if !node.left.nil?
        nodes.push([node.right, depth+1]) if !node.right.nil?
      end    
    end
    return true  
  end  
end

tree = Tree.new
tree.root = Node.new(1)
tree.root.left = Node.new(2)
tree.root.right = Node.new(3)
tree.root.left.left = Node.new(4)
tree.root.left.left.left = Node.new(5)
# puts "Tree is Balanced #{tree.balanced}"
# tree.isBalanced(tree.root)
# puts "Tree is Balanced #{tree.balanced}"
puts tree.isBalancedIterative(tree.root)