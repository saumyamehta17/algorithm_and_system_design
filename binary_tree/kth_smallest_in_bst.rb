Node = Struct.new(:data, :left, :right)
class BST
  attr_accessor :root

  def initialize(val)
    @root = Node.new(val)
  end

  def self.sample
    bst = BST.new(20)
    root = bst.root
    root.left = Node.new(15)
    root.right = Node.new(30)
    root.left.left = Node.new(10)
    root.left.right = Node.new(18)
    root.right.left = Node.new(24)
    root.right.right = Node.new(50)
    root.left.right.left = Node.new(16)
    root.right.right.left = Node.new(32)
    bst
  end

  def kth_smallest(node, k)  
    s1 = []
    i = 0
    s1.push(node)
    node = node.left
    while(!s1.empty?)
      while(!node.nil?)
        s1.push(node)
        node = node.left
      end  
      node = s1.pop
      i += 1
      # puts i
      # puts node.data
      if(i == k)
        return node.data
      end

      s1.push(node.right)  if !node.right.nil?
      node = node.right && node.right.left || nil
    end
    return 'not found.'  
  end  
end

bst = BST.sample  
puts bst.kth_smallest(bst.root, 2)