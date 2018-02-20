DLNode = Struct.new(:data, :prev, :next)
Node   = Struct.new(:data, :left, :right)

class Binary
  attr_accessor :dlnode, :root

  def initialize(val)
    @root = Node.new(val)
    @dlnode = DLNode.new(0)
  end

  def self.sample
    bt = Binary.new(1)
    _r = bt.root
    _r.left = Node.new(2)
    _r.right = Node.new(3)
    _r.left.left = Node.new(4)
    _r.left.right = Node.new(5)
    _r.right.left = Node.new(6)
    _r.right.right = Node.new(7)
    bt
  end 

  def process_vertically(node = root, dl_node = dlnode)
    return nil if node.nil?

    dl_node.data += node.data

    if(!node.left.nil?)
      if(dl_node.prev.nil?)
        dl_node.prev = DLNode.new(0)
        dl_node.prev.next = dl_node
      end
      process_vertically(node.left, dl_node.prev)  
    end
    
    if(!node.right.nil?)
      if(dl_node.next.nil?)
        dl_node.next = DLNode.new(0)
        dl_node.next.prev = dl_node
      end
      process_vertically(node.right, dl_node.next)  
    end
  end  

  def traverse_to_front
    curr = dlnode
    while(!curr.prev.nil?)
      curr = curr.prev
    end
    @dlnode = curr  
  end

  def print_now
    curr = dlnode
    while(!curr.nil?)
      p curr.data
      curr = curr.next
    end  
  end  

  def process
    process_vertically
    traverse_to_front
    print_now
  end  
end 

bt = Binary.sample 
bt.process