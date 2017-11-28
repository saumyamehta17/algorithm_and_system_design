class Node
  attr_accessor :left, :right, :value

  def initialize(val)
    @value = val
  end  
end  

class BinaryTree
  attr_accessor :root, :max_level

  def initialize(val)
    @root = Node.new(val)
    @max_level = 0
  end

  def self.sample
    tree =  BinaryTree.new(1)
    root = tree.root
    root.left = Node.new(2)
    root.left.right = Node.new(5)
    root.right = Node.new(3)
    root.right.right = Node.new(7)
    tree
    level = 1
    @max_level = 0
    BinaryTree.print_right_view(tree.root, level, 0)
  end  

  def self.print_right_view(root, level, max_level)
    # @max_level = max_level
    return if (root.nil?)
    # print @max_level
    if(@max_level < level)
      print root.value
      @max_level = level
    end

    print_right_view(root.right, level + 1, max_level)
    print_right_view(root.left, level + 1, max_level)
  end

end  

tree = BinaryTree.sample
level = 1
# BinaryTree.print_right_view(tree.root, level, tree.max_level)

  