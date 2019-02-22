def permutate(str, choosen = '')
  if str == ''
    puts choosen
    return
  end
  n = str.length
  for i in 0...n
    char = str[i]
    choosen = choosen + char
    str.slice!(i)

    permutate(str, choosen)

    choosen.chop!
    str.insert(i, char)
  end  
end  
str = 'cat'
permutate(str, choosen = '')