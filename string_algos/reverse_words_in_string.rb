# Time Complexity is o(n), n = length of sentence
# Space Complexity is o(n)
def reverse_words(sentence)
  l, r = 0, sentence.length-1

  while(l <= r && sentence[l] == '')
    l += 1
  end

  while(r >=0  && sentence[r] == '')
    r -= 1
  end

  words, word = '', ''
  while(l <= r)
    if sentence[l] == ' ' && !word.empty?
      words = word + ' ' + words
      word = ''
    else
      word += sentence[l] if sentence[l] != ' '
    end
    l += 1
  end
  words = word + ' ' + words if word

  puts words.strip
end

sentence = 'The Sky is blue'
reverse_words(sentence) # blue is Sky The

sentence = '  hello world! '
reverse_words(sentence) # world! hello

sentence = '  hello    ?'
reverse_words(sentence) # ? hello

def own_split(str)
  size = 0
  n = str.length
  for i in 0...n
    if str[i] == ' '
      size += 1
    end  
  end

  arr = Array.new(size+1)
  k = 0
  start = 0
  for i in 0...n
    if str[i] == ' '
      arr[k] = str[start, i-start]
      k += 1
      start = i + 1
    end  
  end
  arr[k] = str[start, n-start]
  arr
end  

def own_length(str)
  size = 0
  while(1)
    if !str[size].nil?
      size += 1
    else
      return size  
    end  
  end  
end  
