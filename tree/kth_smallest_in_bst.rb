Node = Struct.new(:data, :left, :right)
class BST

  attr_reader :root
  def initialize(val)
    @root = Node.new(val)
  end
  def self.sample
    bst = BST.new(20)
    root = bst.root
    root.left = Node.new(8)
    root.left.left = Node.new(4)
    root.left.right = Node.new(12)
    root.left.right.left = Node.new(10)
    root.left.right.right = Node.new(14)
    root.right = Node.new(22)
    bst
  end

  def kth(node, k)
    s = []; c = 1
    while(true)
      while(!node.nil?)
        s.push(node)
        node = node.left
      end
      return "Stack empty" if s.empty?
      node = s.pop
      if(c == k)
        return node.data
      end  
      c += 1
      s.push(node.right) if !node.right.nil?
      node = node.right
    end  
  end  
end


bst = BST.sample  
puts bst.kth(bst.root, 4)