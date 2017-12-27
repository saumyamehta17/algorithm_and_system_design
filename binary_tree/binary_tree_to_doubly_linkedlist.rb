# Inplace binary tree to doubly linked list

Node = Struct.new(:val, :left, :right)

class BinaryTree
  attr_accessor :root

  def initialize(val)
    @root = Node.new(val)
  end

  def self.sample
    root = BinaryTree.new(10).root
    root.left = Node.new(12)
    root.left.left = Node.new(25)
    root.left.right = Node.new(30)
    root.right = Node.new(15)
    root.right.left = Node.new(36)
    root
  end

  # dll - doubly linkedlist
  # done as inorder traversal..
  def self.binary_to_dll(node)

    if(node.nil?)
      return
    end

    # 1. recurive getting left child
    binary_to_dll(node.left)

    # 2. processing node
    if(@prev.nil?)
      @head = node
    else
      @prev.right = node
      node.left = @prev
    end
    @prev = node  

    # 3.recursive getting right child
    binary_to_dll(node.right)

    @head
  end 

  def self.print_dll(head)
    curr = head
    while(!curr.nil?)
      puts curr.val
      curr = curr.right
    end  
  end 
end  

root = BinaryTree.sample
head = BinaryTree.binary_to_dll(root)
BinaryTree.print_dll(head)