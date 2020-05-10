# Word Ladder
Node = Struct.new(:word, :count)

def shortest_word_edit_path(source, target, words)
  return -1 if words.empty?
  m = source.length
  q = Queue.new
  q.enq(Node.new(source, 0))
  hsh = {}

  while(!q.empty?)
    node = q.deq
    s_word = node.word
    return node.count if s_word == target

    for i in 0...m
      words.each do |word|
        next if (hsh[word] || word.length != m)
        if match_found(i, word, s_word)
          q.enq(Node.new(word, node.count+1))
          hsh[word] = true
        end
      end
    end
  end
  -1
end

def match_found(i, word, source)
  word.delete(word[i]) == source.delete(source[i])
end

source = 'bit'
target = 'dog'
words = ["dog","but", "put", "big", "pot", "pog", "dotg", "lot"]
# words = ["no"]
path_len = shortest_word_edit_path(source, target, words)
puts path_len