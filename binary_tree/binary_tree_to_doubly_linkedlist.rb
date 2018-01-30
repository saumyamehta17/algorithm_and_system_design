# Inplace binary tree to doubly linked list
Node = Struct.new(:data, :left, :right)

class BinaryTree
  attr_accessor :root, :prev, :head

  def initialize(val)
    @root = Node.new(val)
  end

  def self.sample
    bt = BinaryTree.new(1)
    root = bt.root
    root.left = Node.new(2)
    root.right = Node.new(3)
    root.left.left = Node.new(4)
    root.left.right = Node.new(5)
    bt
  end  

  # dll - doubly linkedlist
  # done as inorder traversal..
  def to_dll(node)
    if(node.nil?)
      return
    end
    # 1. recurive getting left child
    to_dll(node.left)

    # 2. processing node
    if(prev.nil?)
      @head = node
    else
      node.left = prev
      @prev.right = node  
    end
    @prev = node  

    # 3.recursive getting right child
    to_dll(node.right)
  end

  def print_dll
    curr = head
    puts head
    while(!curr.nil?)
      puts curr.data
      curr = curr.right
    end  
  end  
end

bt = BinaryTree.sample
bt.to_dll(bt.root)
bt.print_dll