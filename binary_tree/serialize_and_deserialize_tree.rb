Node = Struct.new(:data, :left, :right)

class BinaryTree
  attr_accessor :root, :curr_file

  def initialize(val)
    @root = Node.new(val)
    @curr_file = File.open('binarytree.txt', 'w')
  end

  def self.sample
    bt = BinaryTree.new(10)
    root = bt.root
    root.left = Node.new(11)
    root.right = Node.new(12)
    bt
  end

  def serialize(root)
    if(root.nil?)
      curr_file.print '` '
      return
    end  
    curr_file.print "#{root.data} "
    serialize(root.left)
    serialize(root.right)
  end

  def deserialize(root = nil)

  end 

end  

bt = BinaryTree.sample
bt.serialize(bt.root)
bt.curr_file.close