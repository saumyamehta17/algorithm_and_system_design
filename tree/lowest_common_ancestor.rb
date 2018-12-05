# Time Complexity - o(h) h is height of tree
require 'pry'
class Node
  attr_accessor :left, :right, :val

  def initialize(val)
    @val = val
  end
end

class BinarySearchTree  
  attr_accessor :root, :left_lca_bool, :right_lca_bool

  def initialize(val)
    @root = Node.new(val)
    @left_lca_bool = false
    @right_lca_bool = false
  end

  def self.sample1
    bt = BinarySearchTree.new(1)
    root = bt.root
    root.left = Node.new(2)
    root.right = Node.new(3)
    root.left.left = Node.new(4)
    root.left.right = Node.new(5)
    root.right.left = Node.new(6)
    root.right.right = Node.new(7)
    bt
  end

  def self.sample2
    bt = BinarySearchTree.new(20)
    root = bt.root
    root.left = Node.new(9)
    root.left.left = Node.new(8)
    root.left.right = Node.new(12)
    root.left.right.left = Node.new(10)
    root.left.right.right = Node.new(14)
    root.right = Node.new(22)
    bt
  end

  # BST
  # o(h) bcoz, its not processing each node, but yes is worst case two nodes might at leaf
  # recursive will take o(h) space for call stack
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

  # without using extra space and time complexity is o(h)
  def self.lca_without_recursive(node, n1, n2)
    while(!node.nil?)
      if node.data > n1 && node.data > n2
        node = node.left
      elsif node.data < n1 && node.data < n2
        node = node.right
      else
        return node.data
      end      
    end  
  end  

  # Binary Tree
  def get_lca(node, n1, n2)
    if(node.nil?)
      return nil
    end

    if(node.val == n1)
      self.left_lca_bool = true
        return node
    end  

    if(node.val == n2)
      self.right_lca_bool = true
      return node
    end

    left_lca  = get_lca(node.left, n1, n2)
    # puts "left_lca #{left_lca.nil? ? nil : left_lca.val}"
    right_lca = get_lca(node.right, n1, n2)  
    # puts "right_lca #{right_lca.nil? ? nil : right_lca.val}"

    if(!left_lca.nil? && !right_lca.nil?)
      return node
    end

    left_lca.nil? ? right_lca : left_lca  
  end

  def find(node, val)
    if(node.nil?)
      return nil
    end

    if(node.val == val || find(node.left, val) || find(node.right, val))   
      return true
    end
    false  
  end  

  def lca_with_binary_tree(node, n1, n2)  
    lca = get_lca(node, n1, n2)

    if((left_lca_bool && right_lca_bool) || 
      (left_lca_bool && find(lca, n2)) || 
      (right_lca_bool && find(lca, n1)))

      return lca.val
    else
      "No Lca"  
    end  
  end  
end

node = BinarySearchTree.sample1
# bt = BinarySearchTree.sample2
# puts BinarySearchTree.lca(bt.root, n1, n2)
# puts bt.lca_with_binary_tree(bt.root, n1, n2)
# n1 = 10; n2 = 14
puts bt.lca_with_binary_tree(bt.root, n1, n2)

