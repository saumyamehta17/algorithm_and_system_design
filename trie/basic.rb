# Trie is a special datastructure used to store string
# App - Dictonary

# insert n search whole word
# eow - end of word
require 'pry'
class Node
  attr_reader :data
  attr_accessor :children, :eow

  def initialize(data)
    @data = data
    @eow = false
    @children = []
  end

  def insert(char)
    res = have?(char)
    return res if res

    node = Node.new(char)
    children << node
    node
  end

  def have?(char)
    children.each do |child|
      return child if child.data == char
    end
    false  
  end

  def isWord
    eow
  end

  def isLastNode
    children.empty?
  end  

end  

class Trie
 attr_reader :root

 def initialize(data = nil)
   @root = Node.new(data)
 end

 def insert(word)
   node = root
   word.size.times do |c|
     child = node.insert(word[c])
     node = child
   end
   node.eow = true  
 end

 def find(word)
  node = root
  word.size.times do |c|
    child = node.have?(word[c])
    unless child
      return false
    end
    node = child  
  end
  node
 end

 def delete(word)
  
 end 

 def print_auto_suggestions(node, word)
  if node = find(word)
    auto_suggestion_rec(node, word)
  else
    puts "No Prefix found"
    return -1
  end  
 end

 def auto_suggestion_rec(node, word)
    puts word if node.isWord
    if node.isWord && node.isLastNode
      return
    end

    node.children.each do |child|
      auto_suggestion_rec(child, word + child.data)
    end
  end

end
t = Trie.new
t.insert('abc')
t.insert('abced')
t.insert('xyz')
puts t.find('abce')
puts t.find('xyz')
puts t.find('hel')

t.insert('hell')
t.print_auto_suggestions(t.root, 'hel')