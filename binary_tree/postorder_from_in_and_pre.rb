require 'pry'
class Node
  attr_accessor :left, :right, :value

  def initialize(val)
    @value = value
  end  
end  


class BinaryTree
  attr_accessor :root

  def initialize(val)
    @root = Node.new(val)
  end  

  def self.sample
    tree = BinaryTree.new(1)
    root = tree.root
    root.left  = Node.new(2)
    root.right  = Node.new(3)
    root.left.left = Node.new(4)
    root.left.right = Node.new(5)
    tree
  end 

  def self.find_postorder_from_given_inorder_and_preorder(inorder, preorder, n)
    binding.pry
    root = search_root_index(inorder, preorder[0], n)

    if(root == -1)
      puts 'Something went wrong'
      return
    end  
    if(root != 0) #mean I have left subtree
      pre = preorder; pre.shift
      find_postorder_from_given_inorder_and_preorder(inorder, pre, root)
    end  
    if(root != n-1) #mean I have right subtree
      pre = preorder; inorder.shift(root+1); pre.shift(root+1)
      
      find_postorder_from_given_inorder_and_preorder(inorder, pre, n-root-1)
    end
    puts " #{preorder[0]}"  
  end 

  def self.search_root_index(inorder, element, n)
    i = 0
    while(i < n)
      if(inorder[i] == element)
        puts 'found'
        return i
      end  
      i += 1
    end
    # return -1  
  end  
end  


tree = BinaryTree.sample
inorder = [4,2,5,1,3] #hardcoded inorder traversal result
preorder = [1,2,4,5,3]
BinaryTree.find_postorder_from_given_inorder_and_preorder(inorder, preorder, inorder.length)
