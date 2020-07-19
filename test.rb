class Node
    attr_accessor :val, :isLeaf, :topLeft, :topRight, :bottomLeft, :bottomRight
    def initialize(val=false, isLeaf=false, topLeft=nil, topRight=nil, bottomLeft=nil, bottomRight=nil)
        @val = val
        @isLeaf = isLeaf
        @topLeft = topLeft
        @topRight = topRight
        @bottomLeft = bottomLeft
        @bottomRight = bottomRight
    end
end
def construct(grid)
  len = grid.length
  i = j = 0

  def evaluate(grid, i, j, len)
    # puts "i #{i}, j #{j}, m #{len}"
    # Base Condition
    if len == 1
      return Node.new(grid[i][j] == 1 ? true : false, true)
    end

    top_left  = evaluate(grid, i,       j,       len/2)
    top_right = evaluate(grid, i,       j+len/2, len/2)
    bot_left  = evaluate(grid, i+len/2, j,       len/2)
    bot_right = evaluate(grid, i+len/2, j+len/2, len/2)

    if all_leaf?(top_left, top_right, bot_left, bot_right) && same_val?(top_left, top_right, bot_left, bot_right)
      puts "i #{i}, j #{j}, m #{len}"
      return Node.new(top_left.val, true)
    elsif all_leaf?(top_left, top_right, bot_left, bot_right)

      curr_node = Node.new(true, false)
      curr_node.topLeft = top_left
      curr_node.topRight = top_right
      curr_node.bottomLeft = bot_left
      curr_node.bottomRight = bot_right
      return curr_node
    else
      return Node.new(true, false)
    end
  end
  def print_me(root)
    return if root.nil?
    @res << [root.isLeaf == true ? 1 : 0, root.val == true ? 1 : 0]
    print_me(root.topLeft)
    print_me(root.topRight)
    print_me(root.bottomLeft)
    print_me(root.bottomRight)
  end

  root = evaluate(grid,i,j,len)
  @res = []
  print_me(root)
  puts @res.to_s
  root
end

def all_leaf?(top_left, top_right, bot_left, bot_right)
  top_left.isLeaf && top_right.isLeaf && bot_left.isLeaf && bot_right.isLeaf
end

def same_val?(top_left, top_right, bot_left, bot_right)
  top_left.val == top_right.val && top_right.val ==  bot_left.val && bot_left.val == bot_right.val
end

grid = [[1,1], [1,1]]
# grid = [[0]]
# grid = [[0,1],[1,0]]
grid = [[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0]]
# grid = [[1,1,0,0],[1,1,0,0],[0,0,1,1],[0,0,1,1]]
# grid = [[0,1],[1,0]]
construct(grid)

# require 'pry'
# def find_words(board, words)
#   trie = build_trie(words)
#   m = board.length
#   n = board[0].length
#   visited = Array.new(m) { Array.new(n, false) }
#   @res = []
#
#   def process(i,j,word)
#     if trie
#   end
#
#   for i in 0...m
#     for j in 0...n
#       process(i,j,"")
#     end
#   end
#
#   @res
# end
#
# class TrieLetter
#   attr_reader :val, :children
#   attr_accessor :eow
#
#   def initialize(val)
#     @val = val
#     @eow = false
#     @children = []
#   end
#
#   def insert(letter)
#     node = find(letter)
#     unless node
#       node = TrieLetter.new(letter)
#       children << node
#     end
#     node
#   end
#
#   def find(letter)
#     children.each do |child|
#       if child.val == letter
#         return child
#       end
#     end
#     nil
#   end
# end
#
# class TrieWord
#   attr_reader :head
#
#   def initialize
#     @head = TrieLetter.new("")
#   end
#
#   def insert(word)
#     curr = head
#     word.each_char do |chr|
#       curr = curr.insert(chr)
#     end
#     curr.eow = true
#   end
#
#   def find(word)
#     curr = head
#     word.each_char do |chr|
#       curr = curr.find(chr)
#       return false unless curr
#     end
#     curr.eow
#   end
# end
#
# def build_trie(words)
#   t = TrieWord.new
#   words.each do |word|
#     t.insert(word)
#   end
#   t
#   # puts t.find("oat")
#   # puts t.find("oath")
#   # puts t.find("eat")
# end
#
#
# board = [
#     ['o','a','a','n'],
#     ['e','t','a','e'],
#     ['i','h','k','r'],
#     ['i','f','l','v']
# ]
# words = ['oath', 'eat', 'rain']
# find_words(board, words)

# def all_turned_bulbs_shines?(bulbs, i, n)
#   while(i < n)
#     if bulbs[i] == 1
#       return false
#     end
#     i += 1
#   end
#   true
# end

# def find_moments(arr)
#   moments = 0
#   n = arr.length
#   bulbs = Array.new(n, 0)

#   for i in 0...n
#     j = arr[i] - 1

#     if j == 0 || bulbs[j-1] == 2
#       bulbs[j] = 2
#       k = j+1
#       while(bulbs[k] && bulbs[k] == 1)
#         bulbs[k] = 2
#         k += 1
#       end

#       if all_turned_bulbs_shines?(bulbs, j, n)
#         moments += 1
#       end
#     else
#       bulbs[j] = 1
#     end
#   end

#   moments
# end

# arr = [2,1,3,5,4]
# arr = [2,3,4,1,5]
# arr = [1,3,4,2,5]
# puts find_moments(arr)

# def fib(n)
#   if n == 0 || n == 1
#     return n
#   end

#   fib(n-1) + fib(n-2)
# end

# def print_permutations(str)
#   map = Hash.new(0)
#   str.each_char { |chr| map[chr] += 1}
#   chars = map.keys.sort
#   count = Array.new(0, chars.size)
#   chars.each_with_index { |chr, i| count[i] = map[chr]}
#   helper(chars, count, 0, Array.new(str.length))
# end

# def helper(chars, count, level, result)
#   if level == result.length
#     puts result.join
#     return
#   end

#   for i in 0...count.length
#     next if count[i] == 0
#     new_count = count.dup
#     new_count[i] -= 1
#     result[level] = chars[i]
#     helper(chars, new_count, level + 1, result.dup)
#   end
# end

# for str in ['BCA', 'ABB']
#   puts "Input: #{str}"
#   print_permutations str
# end
