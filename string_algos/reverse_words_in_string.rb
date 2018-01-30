str = "I Love Algo and  Stuff"

str = str.split(/\s/)
len = str.length
result = ""
str.each_with_index do |word, i|
  if( i == len -1 )
    result = word + result
  else  
    result = " " + word + result
  end  
end

puts result  