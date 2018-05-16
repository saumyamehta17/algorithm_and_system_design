Node = Struct.new(:data, :left, :right)

class BinaryTree
  attr_reader :root

  def initialize(data)
    @root = Node.new(data)
  end

  def self.sample
    bt = BinaryTree.new(10)
    root = bt.root
    root.left = Node.new(8)
    root.right = Node.new(2)
    root.left.left = Node.new(3)
    root.left.right = Node.new(5)
    root.right.left = Node.new(2)
    bt
  end

  def self.sample1
    bt = BinaryTree.new(1)
    root = bt.root
    root.left = Node.new(2)
    root.right = Node.new(3)
    bt
  end

  def print(node)
    if node.nil?
      return 
    end  
    print(node.left)
    puts " #{node.data} "
    print(node.right)
  end  

  def create_mirror(node)

    if node.nil? 
      return 
    end  
    if (node.left.nil? && node.right.nil?)
      return 
    end
    
    left = node.left
    right = node.right
    node.left = right
    node.right = left
    create_mirror(node.left)  
    create_mirror(node.right)
  end 
end


bt = BinaryTree.sample
bt.print(bt.root)
bt.create_mirror(bt.root)
puts "--------------"
bt.print(bt.root)
