Node = Struct.new(:data, :left, :right)  

class LeftViewTree
  attr_accessor :root, :maxlevel

  def initialize(val)
    @root = Node.new(val)
    @maxlevel = 0
  end

  def self.sample
    bst = LeftViewTree.new(4)
    root = bst.root
    root.left = Node.new(5)
    root.right = Node.new(2)
    root.right.left = Node.new(3)
    root.right.right = Node.new(1)
    root.right.left.left = Node.new(6)
    root.right.left.right = Node.new(7)
    bst
  end

  def left_view_iterative(node = root)
    q = Queue.new
    q.enq(node)
    while(!q.empty?)
      node_count = q.length
      flag = true
      while node_count > 0
        node = q.deq
        if flag
          puts node.data
          flag = false
        end  
        q.enq(node.left) if node.left
        q.enq(node.right)  if node.right
        node_count -= 1
      end
    end  
  end

  def left_view_recursive(node, level)
    return if node.nil?
    if(maxlevel <= level)
      puts node.data
      @maxlevel = level + 1
    end

    left_view_recursive(node.left, level + 1)
    left_view_recursive(node.right, level + 1)
  end  
end  


bst = LeftViewTree.sample
# bst.left_view_iterative
maxlevel = 0
level = 0
bst.left_view_recursive(bst.root, level)