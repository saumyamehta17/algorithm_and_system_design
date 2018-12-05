# Spiral - spiral form where left to right and right to left

class Node
  attr_accessor :left, :right, :value

  def initialize(value)
    @value = value
  end  
end

class BinaryTree
  attr_accessor :root

  def initialize(val)
    @root = Node.new(val)
  end

  def self.sample_tree
    tree = BinaryTree.new(1)
    root = tree.root
    root.left = Node.new(2)
    root.right = Node.new(3)
    root.left.left = Node.new(7)
    root.left.right = Node.new(6)
    root.right.left = Node.new(5)
    root.right.right = Node.new(4)
    tree
  end

  def self.print_spiral(tree)
    root = tree.root

    stack1 = []
    stack2 = []

    stack1.push(root)
    while(!stack1.empty? || !stack2.empty?)
      while(!stack1.empty?)
        node = stack1.pop
        print node.value
        stack2.push(node.right) unless node.right.nil?
        stack2.push(node.left)  unless node.left.nil?
      end

      while(!stack2.empty?)
        node = stack2.pop
        print node.value
        stack1.push(node.left)  unless node.left.nil? 
        stack1.push(node.right) unless node.right.nil?   
      end
    end
  end    
end  

tree = BinaryTree.sample_tree
BinaryTree.print_spiral(tree)