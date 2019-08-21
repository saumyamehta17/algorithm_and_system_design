  Node = Struct.new(:data, :left, :right)
DLL = Struct.new(:data, :level, :prev, :next)

class BinaryTree
  attr_reader :root, :hsh, :dll_node

  def initialize(val)
    @root = Node.new(val)
  end

  def self.sample
    bt = BinaryTree.new(20)
    root = bt.root
    root.left = Node.new(8)
    root.right = Node.new(22)
    root.right.right = Node.new(25)
    root.right.left = Node.new(4)
    root.left.left = Node.new(5)
    root.left.right = Node.new(3)
    root.left.right.left = Node.new(10)
    root.left.right.right = Node.new(14)
    bt
  end 

  def print_bottom_view_using_hash(node, level)
    return if node.nil?
    hsh[level] = node.data
    print_bottom_view_using_hash(node.left, level-1)
    print_bottom_view_using_hash(node.right, level+1)
  end

  def print_bottom_view_using_doubly_linked_list(node, dl = nil, level = 0)
    return if node.nil?
    if(dl.nil?)
      dl = DLL.new(node.data, level)
    else
      dl.data = node.data if level >= dl.level
    end  

    if node.left
      if(dl.prev.nil?)
        dl.prev = DLL.new
        dl.prev.level = level + 1
        dl.prev.next = dl
      end
      print_bottom_view_using_doubly_linked_list(node.left, dl.prev, level+1)  
    end
    
    if node.right
      if(dl.next.nil?)
        dl.next = DLL.new
        dl.next.level = level+1
        dl.next.prev = dl
      end
      print_bottom_view_using_doubly_linked_list(node.right, dl.next, level+1)  
    end  
    @dll_node = dl  
  end

  def move_dll_to_head
    curr = dll_node
    while(!curr.prev.nil?)
      curr = curr.prev      
    end  
    @dll_node = curr
  end 

  def print_it
    curr = dll_node
    while(!curr.nil?)
      puts curr.data
      curr = curr.next
    end  
  end 
end  

bt = BinaryTree.sample  
# bt.print_bottom_view_using_hash(bt.root, 0)
# puts bt.hsh
bt.print_bottom_view_using_doubly_linked_list(bt.root)
bt.move_dll_to_head
bt.print_it