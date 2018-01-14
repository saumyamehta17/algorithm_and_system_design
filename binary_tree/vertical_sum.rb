require 'pry'
# doubly linkedlist
class DLNode
  attr_accessor :prev, :next, :data
  def initialize(data)
    @data = data
  end
end

# Tree Node
class TNode
  attr_accessor :left, :right, :data

  def initialize(data)
    @data = data
  end
end  

class BinaryTree
  attr_accessor :root, :llnode

  def initialize(data)
    @root = TNode.new(data)
    @llnode = DLNode.new(0)
  end

  def self.sample
    bt = BinaryTree.new(1)
    root = bt.root
    root.left = TNode.new(2)
    root.right = TNode.new(3)
    root.left.left = TNode.new(4)
    root.left.right = TNode.new(5)
    root.right.left = TNode.new(6)
    root.right.right = TNode.new(7)
    bt
  end

  def print_vertical_sum
    print_vertical_sum_util(root, llnode)

    # move doubly linked list at first
    while(!llnode.prev.nil?)
      self.llnode = llnode.prev
    end
    # now traverse
    curr_node = llnode
    while(!curr_node.nil?)
      puts curr_node.data
      curr_node = curr_node.next
    end  
  end  

  def print_vertical_sum_util(tnode, llnode)
    llnode.data = llnode.data + tnode.data

    if(!tnode.left.nil?)
      if(llnode.prev.nil?)
        llnode.prev = DLNode.new(0)
        llnode.prev.next = llnode
      end
      print_vertical_sum_util(tnode.left, llnode.prev)  
    end

    if(!tnode.right.nil?)
      if(llnode.next.nil?)
        llnode.next = DLNode.new(0)
        llnode.next.prev = llnode
      end
      print_vertical_sum_util(tnode.right, llnode.next)  
    end
  end  
end

bt = BinaryTree.sample  
bt.print_vertical_sum