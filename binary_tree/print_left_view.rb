class Node
  attr_accessor :left, :right, :val

  def initialize(val)
    @val = val
  end  
end  

class LeftViewTree
  attr_accessor :root

  def initialize(val)
    @root = Node.new(val)
  end

  def self.sample
    root = LeftViewTree.new(10).root
    root.left = Node.new(20)
    root.right = Node.new(30)
    root.left.left = Node.new(40)
    root.left.right = Node.new(60)
    root
  end

  def self.print_left_view(node, level, max_level)
    @@max_level = max_level || 0
    return if node.nil?
    # puts @max_level
    if(@@max_level <= level)
      print node.val
      @@max_level = level + 1
    end

    self.print_left_view(node.left, level + 1, @@max_level) unless node.left.nil?
    self.print_left_view(node.right, level + 1, @@max_level) unless node.right.nil? 
  end  
end  


root = LeftViewTree.sample
LeftViewTree.print_left_view(root, 0, 0)