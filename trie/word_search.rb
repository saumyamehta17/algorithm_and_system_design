require 'pry'
def exist(board, word)
  trie = make_trie(word)
  rows = board.length
  cols = board[0].length
  visited = Array.new(rows) { Array.new(cols, false) }

  for i in 0...rows
    for j in 0...cols
      return true if explore(board, visited, trie, rows, cols,i,j)
    end
  end
  false
end

def explore(board, visited, trie, rows, cols, i, j)
  if i >= 0 && j >= 0 && i < rows && j < cols
    return true if trie.eow
    trie_node = trie.find(board[i][j])
    if trie_node && !visited[i][j]
      return true if trie.eow
      visited[i][j] = true
      return true if explore(board, visited, trie_node, rows, cols, i-1, j) #TOP
      return true if explore(board, visited, trie_node, rows, cols, i+1, j) #BOTTOM
      return true if explore(board, visited, trie_node, rows, cols, i, j-1) #LEFT
      return true if explore(board, visited, trie_node, rows, cols, i, j+1) #RIGHT
      visited[i][j] = false
    end
  end
end

class TrieLetter
  attr_accessor :val, :children, :eow
  def initialize(val = nil)
    @val = val
    @children = []
    @eow = false
  end

  def insert(chr)
    node = find(chr)
    unless node
      node = TrieLetter.new(chr)
      children << node
    end
    node
  end

  def find(chr)
    children.each do |child|
      return child if child.val == chr
    end
    false
  end
end

class TrieWord
  attr_accessor :head
  def initialize
    @head =  TrieLetter.new
  end

  def insert(word)
    curr = head
    word.each_char do |chr|
      curr = curr.insert(chr)
    end
    curr.eow = true
  end
end

def make_trie(word)
  trie = TrieWord.new
  trie.insert(word)
  trie.head
end

board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
word = 'SEE'
word = 'ABCCED'
word = 'ABCB'
puts exist(board, word)