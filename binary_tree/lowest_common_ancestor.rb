# Time Complexity - o(h) h is height of tree
require 'pry'
class Node
  attr_accessor :left, :right, :val

  def initialize(val)
    @val = val
  end
end

class BinarySearchTree  
  attr_accessor :root

  def initialize(val)
    @root = Node.new(val)
  end

  def self.sample1
    root = BinarySearchTree.new(20).root
    root.left = Node.new(8)
    root.left.left = Node.new(4)
    root.left.right = Node.new(12)
    root.left.right.left = Node.new(10)
    root.left.right.right = Node.new(14)
    root.right = Node.new(22)
    root
  end

  def self.sample2
    root = BinarySearchTree.new(20).root
    root.left = Node.new(9)
    root.left.left = Node.new(8)
    root.left.right = Node.new(12)
    root.left.right.left = Node.new(10)
    root.left.right.right = Node.new(14)
    root.right = Node.new(22)
    root
  end

  def self.lca(node, n1, n2)
    return 'Not Valid Tree' if node.nil?

    if(node.val < n1 && node.val < n2)
      lca(node.right, n1, n2)
    elsif (node.val > n1 && node.val > n2)
      lca(node.left, n1, n2)
    else
      return node.val  
    end

  end  
end

n1 = 8; n2 = 14
# node = BinarySearchTree.sample1
node = BinarySearchTree.sample2
puts BinarySearchTree.lca(node, n1, n2)