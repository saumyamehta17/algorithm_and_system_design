Node = Struct.new(:data, :left, :right)

class BinaryTree
  attr_accessor :root, :curr_file

  def initialize(val)
    @root = Node.new(val)
    # only write
    # @curr_file = File.open('binarytree.txt', 'w')
    # read-write both
    @curr_file = File.open('binarytree.txt', 'r+')
  end

  # BST
  def self.sample_bst
    bt = BinaryTree.new(10)
    root = bt.root
    root.left = Node.new(7)
    root.left.left = Node.new(3)
    root.left.right = Node.new(8)
    root.right = Node.new(12)
    bt
  end

  # to serialize BST we can use preorder traversal
  def serialize_bst(node)
    s = []
    while(1)
      while(!node.nil?)
        curr_file.print("#{node.data} ")
        s.push(node)
        node = node.left
      end
      return 0 if(s.empty?)
      node = s.pop
      node = node.right  
    end  
  end

  def bst_deserialize
    curr_file = File.open('binarytree.txt', 'r+')
    pre = curr_file.read
    pre.strip.split(' ')
    s = []
    s.push(Node.new(pre[0]))
    i = 1
    while(i < pre.length-1)
      peek = s.last
      while(!s.empty? && pre[i] > peek.data)
        temp = s.pop
        peek = s.last
      end

      # put in right
      if(!temp.nil?)
        temp.right = Node.new(pre[i])
        s.push(Node.new(pre[i]))
      # put in left
      else
        peek.left = Node.new(pre[i])
        s.push(Node.new(pre[i]))
      end  

      i += 1
    end
    puts "Hiii - #{s.to_s}"  
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

# bt = BinaryTree.sample
# bt.serialize(bt.root)

bt = BinaryTree.sample_bst
bt.serialize_bst(bt.root)
bt.bst_deserialize
bt.curr_file.close