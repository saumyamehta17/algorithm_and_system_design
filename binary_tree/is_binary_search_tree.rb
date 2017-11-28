class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end

class Node
  attr_accessor :left, :right, :val

  def initialize(val)
    @val = val
  end  
end  
class BinaryTree
  attr_accessor :root

  def initialize(val)
    @root = Node.new(val)
  end  

  def self.sample
    root = BinaryTree.new(4).root
    root.left = Node.new(2)
    root.left.left = Node.new(1)
    root.left.right = Node.new(3)
    root.right = Node.new(5)
    root
  end

  def self.isBST(node, min, max)
    return true if node.nil?

    if(node.val < min || node.val > max)
      return false
    end

    return isBST(node.left, min, node.val) &&
           isBST(node.right, node.val, max)  
  end  
end

root = BinaryTree.sample  

if BinaryTree.isBST(root, Integer::MIN, Integer::MAX)
  puts "is bst"
else
  puts "no bst"
end  