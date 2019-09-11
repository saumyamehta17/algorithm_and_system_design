class Node 
  attr_accessor :data, :children, :eow

  def initialize(data)
    @data = data
    @children = []
    @eow = false
  end

  def insert(chr)
    if node = has?(chr)
    else
      node = Node.new(chr)
      children << node
    end 
    node 
  end  

  def has?(chr)
    children.each do |child|
      if child.data == chr
        return child
      end  
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
  attr_accessor :root

  def initialize
    @root = Node.new('')
  end

  def insert(word)
    node = root
    word.split('').each do |chr|
      child = node.insert(chr)
      node = child
    end
    node.eow = true  
  end

  def find(word) 
    node = root
    word.split('').each do |chr|
      if child = node.has?(chr)
        node = child
      else
        return false
      end  
    end
    # node.eow == true  
    node
  end 

  def print_auto_suggestions(node, word)
    if node = find(word)
      auto_suggestion_rec(node, word)
    else
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
t.insert('adef')
# puts t.find('abc').isWord
t.insert('hello')
t.insert('hell')
t.insert('hel')
t.insert('help')
t.insert('helps')
t.insert('helping')
t.print_auto_suggestions(t.root, 'hel')

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
# 	map = Hash.new(0)
# 	str.each_char { |chr| map[chr] += 1}
# 	chars = map.keys.sort
# 	count = Array.new(0, chars.size)
# 	chars.each_with_index { |chr, i| count[i] = map[chr]}
# 	helper(chars, count, 0, Array.new(str.length))
# end

# def helper(chars, count, level, result)
# 	if level == result.length
# 		puts result.join
# 		return
# 	end

# 	for i in 0...count.length
# 		next if count[i] == 0
# 		new_count = count.dup
# 		new_count[i] -= 1
# 		result[level] = chars[i]
# 		helper(chars, new_count, level + 1, result.dup)
# 	end
# end

# for str in ['BCA', 'ABB']
# 	puts "Input: #{str}"
# 	print_permutations str
# end
