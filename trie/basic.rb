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

 def have?(word)
  node = root
  word.size.times do |c|
    child = node.have?(word[c])
    unless child
      return false
    end
    node = child  
  end
  return node.eow == true
 end

 def delete(word)
  
 end 

end
t = Trie.new
t.insert('abc')
t.insert('abced')
t.insert('xyz')
puts t.have?('abce')
puts t.have?('xyz')  