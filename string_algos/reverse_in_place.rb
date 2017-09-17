require 'pry'
def reverse(str)
  _start = 0
  _end = str.length - 1

  while(_start != _end)
    temp = str[_start]
    str[_start] = str[_end]
    str[_end] = temp
    _start += 1
    _end -= 1
  end  

  str
end  

puts reverse('RADAR')