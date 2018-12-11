# Avl Tree is self-balacing tree where diff b\w height of left and 
# right subtree is not greater than 1
# If tree is skewed, then operations(search, min, max, delete, insert) will go to o(n)
# Avl tree make it o(logn)

Node = Struct.new(:value, :height, :left, :right) do 
         def initialize(*)
          super
          self.height = 1
         end  
      end

class AvlTree
  attr_accessor :root

  def height(node)
    if node.nil? 
      return 0
    end
    node.height 
  end 

  def get_balance(node)
    height(node.left) - height(node.right)
  end 

  def rightRotation(node)
    x = node.left
    tmp = x.right

    x.right = node
    node.left = tmp
    x
  end 

  def leftRotation(node)
    x = node.right
    tmp = x.left

    x.left = node
    node.right = tmp
    x
  end 

  def insert(node, value)

    if node.nil?
      return Node.new(value)
    elsif value < node.value
      node.left = insert(node.left, value)
    elsif value > node.value
      node.right = insert(node.right, value)
    end 

    node.height = 1 + [height(node.left), height(node.right)].max

    balance = get_balance(node)

    # if balance > 1 || balance < -1
    #     puts "#{node.value} --> Not a Avl"
    # end 

    if balance > 1 && value < node.left.value
      puts "Doing Balancing using Left Left Rotation required"
      return rightRotation(node)
    end 

    if balance < -1 && value > node.right.value
      puts "Doing Balancing using Right Right Rotation required at #{node.value}"
      return leftRotation(node)
    end 

    if balance > 1 && value > node.left.value
      puts "Doing Balancing using Left Right Rotation required"
      node.left = leftRotation(node.left)
      return rightRotation(node)
    end 

    if balance < -1 && value < node.right.value
      puts "Doing Balancing using Right Left Rotation required at #{node.value}"
      node.right = rightRotation(node.right)
      return leftRotation(node)
    end 

    node
  end 

  def print_tree(node)
    print_tree(node.left) if !node.left.nil?
    puts "value #{node.value} and height #{node.height}"
    print_tree(node.right) if !node.right.nil?
  end 
end 

tree = AvlTree.new   

# Left Left Rotation example
# tree.root = tree.insert(tree.root, 10)
# tree.root = tree.insert(tree.root, 5)
# tree.root = tree.insert(tree.root, 1)

# Right Right Rotation example
# tree.root = tree.insert(tree.root, 10)
# tree.root = tree.insert(tree.root, 5)
# tree.root = tree.insert(tree.root, 15)
# tree.root = tree.insert(tree.root, 20)
# tree.root = tree.insert(tree.root, 25)

# Right Left Rotation example
# tree.root = tree.insert(tree.root, 10)
# tree.root = tree.insert(tree.root, 5)
# tree.root = tree.insert(tree.root, 15)
# tree.root = tree.insert(tree.root, 20)
# tree.root = tree.insert(tree.root, 19)

# Left Right Rotation example
tree.root = tree.insert(tree.root, 2)
tree.root = tree.insert(tree.root, 1)
tree.root = tree.insert(tree.root, 5)
tree.root = tree.insert(tree.root, 7)
tree.root = tree.insert(tree.root, 9)
tree.root = tree.insert(tree.root, 3)
tree.root = tree.insert(tree.root, 6)
tree.root = tree.insert(tree.root, 8)
puts tree.root
# tree.print_tree(tree.root)
