require 'pry'
class Node
  attr_accessor :value, :left, :right

  def initialize(val)
    @value = val
  end    
end  

class BinaryTree

  attr_accessor :root

  def initialize(val)
    if val.nil?
      @root = nil
    else  
      @root = Node.new val
    end  
  end

  class << self

    def inorder_widout_recursion(tree)
      node = tree.root
      arr = []
      arr.push(node)

      while(!arr.empty?)
        node = node.left  
        while(node != nil)
          arr.push node
          node = node.left
        end  

        node = arr.pop
        puts node.value

        if(!node.right.nil?)
          node = node.right
          arr.push node
        end
      end
    end

    def inorder_wid_recursion(node)
      inorder_wid_recursion(node.left) if(node.left != nil)
      puts node.value
      inorder_wid_recursion(node.right) if(node.right != nil)
    end  

    def preorder_wid_recursion(node)
      puts node.value
      preorder_wid_recursion(node.left) if (node.left != nil)
      preorder_wid_recursion(node.right) if (node.right != nil)
    end  

    def postorder_wid_recursion(node)
      postorder_wid_recursion(node.left) if (node.left != nil)
      postorder_wid_recursion(node.right) if (node.right != nil)
      puts node.value
    end  

    def sample
      sample_tree = BinaryTree.new 1
      root = sample_tree.root 
      root.left = Node.new 2
      root.right = Node.new 3
      root.left.left = Node.new 4
      root.left.right = Node.new 5
      # root.left.right.left = Node.new 6

      # root.right.left = Node.new 7
      # root.right.left.left = Node.new 8
      # root.right.left.right = Node.new 9

      # root.left.left.right = Node.new 10

      sample_tree
    end
  end
end  

b = BinaryTree.sample
puts "---------Inorder Traversal without recursion using stack--"
BinaryTree.inorder_widout_recursion(b)
puts "---------Inorder Traversal with recursion-----------------"
BinaryTree.inorder_wid_recursion(b.root)
puts "---------Preorder Traversal with recursion-----------------"
BinaryTree.preorder_wid_recursion(b.root)
puts "---------Postorder Traversal with recursion-----------------"
BinaryTree.postorder_wid_recursion(b.root)