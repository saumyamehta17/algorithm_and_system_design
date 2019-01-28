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


def reverse_words(str)
  arr = my_split(str)
  low = 0
  hi = own_length(arr) - 1
  while(low < hi)
    tmp = arr[low]
    arr[low] = arr[hi]
    arr[hi] = tmp
    low += 1
    hi -= 1
  end  
  puts arr.to_s
  # puts arr.join(' ')
end  

def my_split(str)
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

str = "I am very active"
reverse_words(str)
# my_split(str)
# own_length(str)