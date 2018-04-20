class DLL
  attr_accessor :data, :prev, :next

  def initialize
    @data = []
  end
end  

Node = Struct.new(:data, :left, :right)

class BinaryTree
  attr_reader :root, :dll_node

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

  def print_in_vertical(node, dl = nil)
    return if node.nil?
    if(dl.nil?)
      dl = DLL.new
    end
    dl.data << node.data

    if(node.left)
      if(dl.prev.nil?)
        dl.prev = DLL.new
        dl.prev.next = dl
      end
      print_in_vertical(node.left, dl.prev)
    end
    
    if(node.right)
      if(dl.next.nil?)
        dl.next = DLL.new
        dl.next.prev = dl
      end
      print_in_vertical(node.right, dl.next)    
    end
    @dll_node = dl
  end 

  def move_to_head
    cur = dll_node
    while(!cur.prev.nil?)
      cur = cur.prev
    end
    @dll_node = cur  
  end  

  def print_it
    move_to_head
    curr = dll_node
    while(!curr.nil?)
      puts curr.data.to_s
      curr = curr.next
    end  
  end

end  
bt = BinaryTree.sample  
bt.print_in_vertical(bt.root)
bt.print_it