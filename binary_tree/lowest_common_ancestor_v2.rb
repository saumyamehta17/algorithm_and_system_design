Node  = Struct.new(:data, :left, :right)
class BinaryTree
  attr_reader :root

  def initialize(data)
    @root  = Node.new(data)
  end

  def self.sample
    bt = BinaryTree.new(1)
    root = bt.root
    root.left = Node.new(2)
    root.right = Node.new(3)
    root.left.left = Node.new(4)
    root.left.right = Node.new(5)
    root.right.left = Node.new(6)
    root.right.right = Node.new(7)
    bt
  end
  
  def lca(node, n1, n2)
    return nil if node.nil?
    return node if node.data == n1 || node.data == n2

    left = lca(node.left, n1, n2)
    right = lca(node.right, n1, n2)

    return nil if left.nil? && right.nil?
    return node if !left.nil? && !right.nil?

    left.nil? ? right : left
  end

  def lca_with_path(node, n1, n2)  
    path1 = []; path2 = []
    find_path(node, n1, path1)
    find_path(node, n2, path2)
    len1 = path1.length
    len2 = path2.length
    if len1 == 0 || len2 == 0
      return -1
    end
    if len1 > len2
      temp = path1
      path1 = path2
      path2 = temp
    end  
    for i in 0...path1.length
      if path1[i] != path2[i]
        break
      end  
    end
    if i == path1.length-1
      path1[i]
    else  
      path1[i-1]  
    end  
  end  

  def find_path(node, val, path)
    if node.nil?
      return false
    end
    path << node.data
    if node.data == val
      return true
    end

    if !node.left.nil? && find_path(node.left, val, path)
      return true
    end  

    if !node.right.nil? && find_path(node.right, val, path)
      return true
    end  
  end  
end  

bt = BinaryTree.sample
n1 = 2
n2 = 4
node  = bt.lca(bt.root, n1, n2)
puts node.data
puts "------ using path array ---------"
puts bt.lca_with_path(bt.root, n1, n2)  
