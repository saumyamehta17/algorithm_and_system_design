require 'pry'
def word_break(s, word_dict)
  trie = make_trie(word_dict)
  explore(s, trie, 0, s.length)
end

def explore(s, trie, start_indx, last_indx)
  curr = trie
  return true if start_indx >= last_indx
  return false if curr.find(s[start_indx]).nil?
  eows = []
  for i in start_indx...last_indx
    curr = curr.find(s[i])
    break if curr.nil?
    eows << i+1 if curr.eow
  end
  # binding.pry
  res = eows.map do |x|
    explore(s, trie, x, last_indx)
  end
  if res.include?(true)
    result[0] = true
    true
  else
    false
  end
end

def make_trie(word_dict)
  trie = TrieWord.new
  word_dict.each do |word|
    trie.insert(word)
  end
  trie.head
end

class TrieWord
  attr_accessor :head

  def initialize(val = nil)
    @head = TrieLetter.new(val)
  end

  def insert(word)
    curr = head
    word.each_char do |chr|
      curr = curr.insert(chr)
    end
    curr.eow = true
  end
end

class TrieLetter
  attr_accessor :val, :children, :eow
  def initialize(val)
    @val = val
    @children = []
    @eow = false
  end

  def insert(letter)
    node = find(letter)
    if node.nil?
      node = TrieLetter.new(letter)
      children << node
    end
    node
  end

  def find(letter)
    children.each do |child|
      return child if child.val == letter
    end
    nil
  end
end


s = "acaaaaabbbdbcccdcdaadcdccacbcccabbbbcdaaaaaadb"
# s = "acaaaaabbbdbcccd"
word_dict = ["abbcbda","cbdaaa","b","dadaaad","dccbbbc","dccadd","ccbdbc","bbca","bacbcdd","a","bacb","cbc","adc","c","cbdbcad","cdbab","db","abbcdbd","bcb","bbdab","aa","bcadb","bacbcb","ca","dbdabdb","ccd","acbb","bdc","acbccd","d","cccdcda","dcbd","cbccacd","ac","cca","aaddc","dccac","ccdc","bbbbcda","ba","adbcadb","dca","abd","bdbb","ddadbad","badb","ab","aaaaa","acba","abbb"]
s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"
s = "aaa"
word_dict = ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]
puts word_break(s, word_dict)