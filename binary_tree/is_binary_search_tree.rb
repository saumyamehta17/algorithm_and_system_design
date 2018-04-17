MIN = -4611686018427387903
MAX =  4611686018427387903
Node = Struct.new(:data, :left, :right)
class BT
  attr_reader :root

  def initialize(val)
    @root = Node.new(val)
  end

  def self.sample
    bt = BT.new(4)
    root = bt.root
    root.left = Node.new(2)
    root.left.left = Node.new(1)
    root.left.right = Node.new(3)
    root.right = Node.new(5)
    bt
  end 

  def is_bst(node, min, max)
    return true if node.nil?
    if node.data < min || node.data >= max
      return false
    end

    return is_bst(node.left, MIN, node.data) &&  
           is_bst(node.right, node.data, MAX)
  end 
end  

bt = BT.sample
puts bt.is_bst(bt.root, MIN, MAX)