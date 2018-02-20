

def reverse_words(words)
  result = ''
  size = words.length-1
  words.each_with_index do |word, i|
    if(size == i)
      result = word + result
    else
      result = " " + word + result
    end  
  end
  puts result  
end  


sen = 'I love algo very much   and you'

words = sen.split(/\s/)

reverse_words(words)